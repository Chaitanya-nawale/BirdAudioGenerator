import argparse
import ast
import torch
from semdiffusers import SemanticEditPipeline

def parse_args():
    parser = argparse.ArgumentParser(description="Run SemanticEditPipeline with full configuration from command line.")

    parser.add_argument("--prompt", type=str, required=True, help="Base text prompt")
    parser.add_argument("--seed", type=int, default=42, help="Random seed")
    parser.add_argument("--title", type=str, required=True, help="Unique identifier for output file name")

    parser.add_argument("--num_images_per_prompt", type=int, default=1)
    parser.add_argument("--guidance_scale", type=float, default=7.0)
    parser.add_argument("--editing_prompt", type=str, required=True,
                        help="A list or tuple of editing prompts. For example: '[\"edit1\", \"edit2\"]'"),
    parser.add_argument("--reverse_editing_direction", type=str, required=True,
                        help="Comma-separated booleans like 'True,False'")
    parser.add_argument("--edit_warmup_steps", type=str, required=True,
                        help="Comma-separated integers like '20,10,11'")
    parser.add_argument("--edit_guidance_scale", type=str, required=True,
                        help="Comma-separated floats like '2000,2000,2000'")
    parser.add_argument("--edit_threshold", type=str, required=True,
                        help="Comma-separated floats like '-0.2,-0.1,-0.1'")
    parser.add_argument("--edit_weights", type=str, required=True,
                        help="Comma-separated floats like '1.2,1,1'")
    parser.add_argument("--edit_momentum_scale", type=float, default=0.25)
    parser.add_argument("--edit_mom_beta", type=float, default=0.6)

    args = parser.parse_args()

    return args

def to_list(val, cast_type=str, sep=","):
    return [cast_type(v.strip()) for v in val.split(sep)]

def main():
    args = parse_args()
    device = "cuda" if torch.cuda.is_available() else "cpu"

    pipe = SemanticEditPipeline.from_pretrained(
        "stable-diffusion-v1-5/stable-diffusion-v1-5"
    ).to(device)

    gen = torch.Generator(device=device).manual_seed(args.seed)

    out = pipe(
        prompt=args.prompt,
        generator=gen,
        num_images_per_prompt=args.num_images_per_prompt,
        guidance_scale=args.guidance_scale,
        editing_prompt=ast.literal_eval(args.editing_prompt),
        reverse_editing_direction=ast.literal_eval(args.reverse_editing_direction),
        edit_warmup_steps=ast.literal_eval(args.edit_warmup_steps),
        edit_guidance_scale=ast.literal_eval(args.edit_guidance_scale),
        edit_threshold=ast.literal_eval(args.edit_threshold),
        edit_weights=ast.literal_eval(args.edit_weights),
        edit_momentum_scale=args.edit_momentum_scale,
        edit_mom_beta=args.edit_mom_beta,
    )

    image = out.images[0]
    image.save(f"results/images/semantic_edit_output_{args.title}.png")
    print("✅ Saved image as semantic_edit_output.png")

if __name__ == "__main__":
    main()
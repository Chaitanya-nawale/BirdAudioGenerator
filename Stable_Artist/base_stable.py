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
        guidance_scale=args.guidance_scale
    )

    image = out.images[0]
    image.save(f"results/images/base_output_{args.title}.png")
    print("✅ Saved image as base_output.png")

if __name__ == "__main__":
    main()
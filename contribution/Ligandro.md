

# Ligandro 02/05/2025

# Stable Artist

## Overview
The **Stable Artist** project uses text prompts to guide the **latent diffusion model space**. It does not involve any training, but utilizes **Stable Diffusion** and other libraries for generating and editing images based on input text prompts. The goal is to provide a framework for **semantic image editing** using latent space manipulation.

## Links

* [Semantic Image Editing GitHub Repository](https://github.com/ml-research/semantic-image-editing/tree/StableArtist)
* [Diffusers GitHub Repository](https://github.com/huggingface/diffusers)
* [Stable Diffusion Model - Hugging Face](https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-v1-5)

## For running inference 

### Step 1: Upgrade Pillow
```bash
pip install --upgrade pillow
````

### Step 2: Install Diffusers

```bash
pip install --upgrade diffusers[torch]
```

### Step 3: Fix for Stable Diffusers

Modify `sem_diffusers\pipeline_latent_edit_diffusion.py` to include:

```python
import diffusers.pipelines.pipeline_utils
```

### Result

* **Base Image Generation**: 13 minutes runtime on a **4GB RTX 3050** for generating the base image.

![Base Image](images/dll1.png)
* **Editing with Prompt**: 30 minutes runtime for image editing with the following prompt:

  ```python
  editing_prompt = [
    'oil painting, drawing',
    'modern bridge',
    'ship on a river, ship'
  ]
  ```
![Stable Artist Result](images/dll2.png)

## Future Work

1. Train audio encoder and text encoder to get the editing prompts from audio
2. Use audio and text data for training
3. This basically means we are converging towards TPOS but for single frame

## Potential Enhancements

* We could also change the way the text encoding moves the stable diffusion process in latent space



# Ligandro 08/05/2025

🎧 Stable Audio
Stable Audio is a generative audio model capable of producing variable-length stereo audio (up to 47 seconds) at 44.1 kHz from text prompts.

🔧 Model Overview
🧠 Input
Text Prompts

🎵 Output
Variable-length stereo audio

Maximum Duration: 47 seconds

Sample Rate: 44.1 kHz

🧩 Main Components
1. Autoencoder
Compresses raw audio waveforms

Reduces sequence length for efficient downstream processing

2. Text Embedding
Uses the T5-base model

Encodes text prompts into embeddings for conditioning

3. Diffusion Transformer (DiT)
Transformer-based latent diffusion model

Operates in the latent space of the autoencoder

Generates audio guided by the text embeddings

📦 Datasets Used
Total Recordings: 486,492
Freesound: 472,618 samples

Free Music Archive (FMA): 13,874 samples

These datasets are used to train:

The Autoencoder

The Diffusion Transformer (DiT)

🎯 Text Conditioning
Prompt embeddings are generated using the publicly available T5-base model

🛑 Conclusion
Although Stable Audio was abandoned, it produced decent results, particularly on Lofi audio prompts.





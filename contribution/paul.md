## 📅 Weekly Contribution Details

### Week 1 (30-04 to 07-05)
Had to find my bearing after joining the group slightly later on.

1. Reseached audio to visual models for the StableLoFiEditor idea
2. Looked into other datasets 
3. Got some older web scraper I built to work for Youtube videos

Learned a bit about audio to video models and how to infer intermediate frames to generate a video from single frames. However, idea was ultimately scrapped.
I looked into further datasets and settled on the possibility of simply scraping further Youtube videos. I got an old webscraper I built for my Bachelor's to work on scraping Youtube videos.

---

### Week 2 (07-05 to 14-05)
Did not have much time this week due to visit at my parents'. Looked into computing the latents in MMAudio, but we pivoted to another topic before getting anywhere with that.
---

### Week 3 (14-05 to 21-05)

1. Ran initial inference on MMAudio using the iNaturalist dataset. 
2. Checked whether image data is useable if converted to static video of a single image. It is.
3. Created presentation template.

I was ready to stay with MMAudio, but ultimately got swayed by the much smaller computation time of AudioLDM.
---
### Week 4 (21-05 to 28-05)

1. Looked into a way to replace the text embedding in the model with an image embedding.


---
### Week 5 and 6 (28-05 to 11-06)

I will put my notes on the joint Language-Audio-Embedding Model here.

From Paper:
- Pipeline of Contrastive Language-Audio Pretraining (CLAP) for learning joint audio and text embeddings
- Trained on audio datasets with text captions
- Audio encoder based on HTSAT, text encoder based on RoBERTa
- Symmetric cross-entropy loss to train these contrastive encoders

In Code:
- CLAP in audiodlm_train/modules/clap

- In clap/training/main.py call of create_model from open_clip
	- text model passed here
	- calls train_one_epoch with the model in line 517
		- defined in train.py
		- calls text_features and text_features_mlp for the loss function in line 103
	-
- create_model defined in clap/open_clip/factory.py

- main CLAP model in clap/open_clip/model.py

	- definitions for the text branch parameters

	- case "roberta" in line 516
		- imports base weights for roberta from transformers module
			- passed to self.text_branch
		- defines MLP Layers for transform and defines dropout
			- calls MLPLayers, a small nn.Module, with joint_embed_shape, which is just an int = 512
			- passed to self.text_transform
				- used for text_features_mlp
		- defines text projection
			- text_projection: nn.Sequential of a linear layer, a ReLu, and another linear layer
			- passed to self.text_projection
				- used in encode_text

	- further parameters in line 577, define width

	- encoding of text in line 630, function encode_text
		- x = roberta(input_ids = text["input_ids"].to(device), attention_mask=text["attention_mask"].to(
                        device))
		- x = text_projection(x)
		- return x

	- forwarding of text and audio into CLAP in line 681, mostly calling previously defined functions
		- text_features: encode_text, normalize
		- text_features_mlp: text_transform
	- function to get the text embedding from the model in line 731

Description of /modules/ folder:

- audiomae: Masked Autoencoder. Not directly mentioned in the paper. 
- clap: CLAP pipeline for learning joint audio text embeddings
	- open_clip:
	- training:
- diffusionmodules: Modules used in the Latent Diffusion model and the Autoencoder
- hifigan: HiFi-GAN used as vocoder in last step
- latent_diffusion: The Latent Diffusion model
- latent_encoder: The Variational Autoencoder
- phoneme_encoder: A text encoder. Not directly mentioned in the paper. No idea where this is used.


---
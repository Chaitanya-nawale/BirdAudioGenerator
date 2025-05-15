# Project Development Tracker

Here we will track progress, outline the full pipeline, and manage weekly goals. Updates will be recorded as and when necessary.

---


## 📅 Weekly Development Goals

### Week 1 (30-04 to 07-05)

| Developer | Tasks | Status | Comments |
|-----------|----------------|--------|----------|
| Lloyd | - Literature review<br>- Setup gitlab & sciebo for project tracking | -🔄 Ongoing<br>-✅ Done | Literature review is in progress find detailed updates at references/ |
| Ligandro | - Setup Stable Artist on Local and Cluster <br>-Ran inference  | ✅ Done | _To be filled_ |
| Chaitanya | - Assisted Ligandro to setup Stable Artist on RWTH Cluster <br> - Researched about audio to text models | -✅ Done<br>-❌ Abandoned | The audio to text models which are present online are mostly transcription models. I was unable to find a suitable model for our task. |
| Paul | - _To be filled_ | _To be filled_| _To be filled_|
| Lukas | - _To be filled_ | _To be filled_ | _To be filled_ |

> Names are in no particular order
<br>
> ✅ Done 🔄 Ongoing ⏳ Pending ❌ Abandoned

#### Meeting Notes
| Discussion Points |
|-------------------|
| Give Stable Artist multiple text prompts and see if the transitions look good. Understand the latent space of Stable Artist |
| Find a model for classifying audio, both quantitative (e.g. a bird sound appears, model says "theres a bird now") and qualitative (e.g. how intense the audio is; mood). Can start with VGGSound. |
| Literature review of Stable Artist, look into possible metric, layer based image editing |
| There is no clear objective to baseline next week and generating video is computationally expensive so Pivot suggestion by Christian: Predict music from images(video) |
| New set of Tasks would include <br> 1. Find a Baseline preferably with Video to music generation if not a good first step would be image + text to music or just text to music <br> 2. Preprocess the Ambient audio dataset to serve as video to music pairs for finetuning <br> |


---

### Week 2 (07-05 to 14-05)

| Developer | Tasks | Status | Comments |
|-----------|----------------|--------|----------|
| Lloyd | -setup nvtop, ffmpeg and av-benchmark for MMAudio <br> -explored and tried to preprocess the ambient audio dataset <br> -explored other possible datasets details in my contrib md| -✅ Done <br> - ✅ Done <br> - ✅ Done| -Had to abandone literature review as a member left the group |
| Ligandro | -Tested Stable Audio for text to audio generation | -✅ Done | -Gave decent results on lofi audio prompts so cannot train further  |
| Chaitanya | - Researched for text/video to audio models and found MMAudio model which can be suitable for our task <br> - Set up MMAudio on cluster and tested a few prompts on it| -✅ Done <br> - ✅ Done  |  |
| Paul |  |  |  |
| Lukas | ❌ Abandoned | |  |

> Names are in no particular order
<br>
> ✅ Done 🔄 Ongoing ⏳ Pending ❌ Abandoned

#### Meeting Notes
| Discussion Points |
|-------------------|
| More engagement on the whatsapp group to have detailed discussions | 
| Potential tasks(use this as reference but feel free to do anything you feel is relevant): <br> 1. Download and preprocess the INaturalist Sounds [github](https://github.com/visipedia/inat_sounds/tree/main/2024) [paper](https://proceedings.neurips.cc/paper_files/paper/2024/file/ef3713b8d72266e803f9346088fed92d-Paper-Datasets_and_Benchmarks_Track.pdf)  and INauralist Images dataset [github](https://github.com/visipedia/inat_comp/tree/master/2021)  to create image audio training pairs <br> 2. Choose 4 datasets from Table 1. in the BirdSet dataset [paper](https://arxiv.org/pdf/2403.10380v3) [github](https://github.com/DBD-research-group/BirdSet) except INaturalist and do a deep dive of a relevant subset <br> 3. Looking for good image to audio generative models keeping compute resources in mind <br> 4. Performing a finetuning run on a pretrained model tracking metrics like training loss and validation loss. <br> 5. Setting up a classification model to track improvement in performance | 
| Fill the tasks of next week with what you will be working on or mention on the whasapp group | 

---

### Week 3 (14-05 to 21-05)

| Developer | Tasks | Status | Comments |
|-----------|----------------|--------|----------|
| Lloyd | 1. Download and preprocess iNaturalist Sounds and iNaturalist Images to create image-audio pairs <br> 2. Look for image to audio models that are more relevant and easier to train than MMAudio <br> 3. Do one finetuning run and report metrics | 1. 🔄  <br> 2. 🔄  <br> 3. 🔄  | -> On second thought I will not try to run a training using MMAudio as it relies heavily on text embeddings and their pipeline is a bit complicated |
| Ligandro |  | |  |
| Chaitanya | |  |  |
| Paul |  |  |  |

> Names are in no particular order
<br>
> ✅ Done 🔄 Ongoing ⏳ Pending ❌ Abandoned

#### Meeting Notes
| Discussion Points |
|-------------------|
| _To be filled_ | 
| _To be filled_ | 
| _To be filled_ | 
| _To be filled_ | 
| _To be filled_ | 
| _To be filled_ | 


## 🆕 Updates Log

A running log of key updates and changes.

| Date       | Update Summary  | 
|-----------|-------------------------------------------------------------------------------|
| 30-04 | Moved away from [TPoS](https://arxiv.org/abs/2309.04509) due to fairly complex implementation, lack of good quality results, time consuming first step towards implementation and long inference time.                          |
| 14-05 | Have to let go of the [ambient-audio dataset](https://huggingface.co/datasets/igorriti/ambience-audio) due to potential youtube copyright violations|
| 14-05 | Pivot to image to audio generation with respect to birds |
---




## 🧑‍💻 Individual contributions

Individual contributions can be tracked at contribution/\<name\>.md 


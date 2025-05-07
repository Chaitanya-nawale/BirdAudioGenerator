# Project Development Tracker

Here we will track progress, outline the full pipeline, and manage weekly goals. Updates will be recorded as and when necessary.

---


## 📅 Weekly Development Goals

### Week 1 (30-04 to 07-05)

| Developer | Tasks | Status | Comments |
|-----------|----------------|--------|----------|
| Lloyd | - Literature review<br>- Setup gitlab & sciebo for project tracking | -🔄 Ongoing<br>-✅ Done | Literature review is in progress find detailed updates at references/ |
| Ligandro | - _To be filled_ | _To be filled_| _To be filled_ |
| Chaitanya | - _To be filled_ | _To be filled_ | _To be filled_|
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
| New set of Tasks would include |
| Find a Baseline preferably with Video to music generation if not a good first step would be image + text to music or just text to music |
| Preprocess the Ambient audio dataset to searve as video to music pairs for finetuning |


---

### Week 2 (07-05 to 14-05)

| Developer | Assigned Tasks | Status | Comments |
|-----------|----------------|--------|----------|
| Lloyd | |  |  |
| Ligandro |  | |  |
| Chaitanya | |  |  |
| Paul |  |  |  |
| Lukas |  | |  |

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


## 🔁 Pipeline Overview

1. [ Text Prompt ] -----> [ Stable Artist {Generate Base Image}]
2. [ Lofi Audio ] --> [ Audio-to-Text {Extract time wise text desc of audio} ] -- text-based instructions --> [ Stable Artist {Diffuses Over Base Image} ]



## 🆕 Updates Log

A running log of key updates and changes.

| Date       | Update Summary  | 
|-----------|-------------------------------------------------------------------------------|
| 30-04 | Moved away from [TPoS](https://arxiv.org/abs/2309.04509) due to fairly complex implementation, lack of good quality results, time consuming first step towards implementation and long inference time.                          |

---

## 📌 Notes

Next tasks:



---


## 🧑‍💻 Individual contributions

Individual contributions can be tracked at contribution/\<name\>.md 


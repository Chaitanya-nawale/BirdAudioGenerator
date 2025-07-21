# Chaitanya Contribution Tracker

---


## 📅 Weekly Contribution Details

### Week 1 (30-04 to 07-05)
1. Assisted Ligandro to setup Stable Artist on RWTH Cluster
2. Researched about audio to text models

The audio to text models which are present online are mostly transcription models.
I was unable to find a suitable model for our task.

---

### Week 2 (07-05 to 14-05)
Moved away from [TPoS](https://arxiv.org/abs/2309.04509) due to fairly complex implementation, lack of good quality results, time consuming first step towards implementation and long inference time.
We pivoted to text/video to audio generation models .

1. Researched for text/video to audio models and found MMAudio model.
2. Set up MMAudio on cluster and performed inference with it

The MMAudio model is a lightweight solution and is well suited for the task of generating audio for the video. The next step is to start training the model on the ambience-audio dataset.
---

### Week 3 (14-05 to 21-05)

---
Had to let go of the [ambient-audio dataset](https://huggingface.co/datasets/igorriti/ambience-audio) due to potential youtube copyright violations.
Pivot to image to audio generation with respect to birds.

Researched about datasets
---


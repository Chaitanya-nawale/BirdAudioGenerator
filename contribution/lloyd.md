# 07-05-2025

## Ambience-audio dataset
[link](https://huggingface.co/datasets/igorriti/ambience-audio)
The definition of Ambience is rather vague in the ambience-audio dataset. Some people use pure nature sound while others associate it with nature sounds+music. The background visual may or may not relate to the audio and there's no way to check for that quickly. On inspecting the ambience-audio dataset several issues creep up.

1. MMAudio may struggle with examples such as these where the nature sounds are suppressed by the music. There is no way to check how well the audio aligns with the caption and visual. As "background music" and "orchestral music" can translate to anything.
-c_7OYYoQJY - Fantasy forest ambience with nature sounds and background music. 
dQZ6VMrMK7M - Sci-fi ambient sounds with orchestral music and futuristic space effects.
9Hv2jIQwmCI - Spacecraft interior with ambient space sounds and distant cosmic noise.

2. Captions in the dataset may not be fully accurate. In the below example there are no soldiers communicating
UpO_pU0i530 - World War 1 battlefield ambience with sounds of distant explosions, gunfire, and soldiers communicating.

3. Background visual is barely visible
NGxWqC4N28w - Forest at night ambience with eerie sounds and haunting background effects.


In addition while the data may be used under the fair use policy(to be confirmed). Downloading data using yt-dlp is illegal in Germany due to data protection laws. So in my opinion it's not safe to use as a dataset unless we get permission to do so. Even if it was the quality of this dataset doesn't match the effort required.

## Potential datasets for ambience audio

1. [AutoReCap](https://snap-research.github.io/GenAU/dataset.html)<br> This is a huge audio-text-video dataset for ambient audio. They do some text to audio generation. We can do image to audio synthesis based on this dataset. Same issue as ambience-audio dataset. It uses yt-dlp internally. 

2. [SoundNet](https://soundnet.csail.mit.edu/)<br>
Another image to sound dataset for ambient sounds like river, beach, vegetation etc.

3. [Environmental Audio sounds](https://homepages.tuni.fi/toni.heittola/datasets)<br>
No accompanying video but there's a large collection of labelled audio.


4. [Sounding Earth Dataset](https://zenodo.org/records/5600379)<br>
Aerial images accompanied with high quality audio. Not sure what each sample sounds like but worth exploring.

5. [iNaturalistSound dataset](https://github.com/visipedia/inat_sounds/tree/main/2024)<br>
This is a comprehensive dataset of different species of animals and the sounds they make. This may lead to some creative ideas but may require us to pivot again.


# 14-05-2025

## Potential Pivot Idea with same theme of image to audio generation:
Use the iNaturalist Sounds  dataset [github](https://github.com/visipedia/inat_sounds/tree/main/2024) [paper](https://proceedings.neurips.cc/paper_files/paper/2024/file/ef3713b8d72266e803f9346088fed92d-Paper-Datasets_and_Benchmarks_Track.pdf) in addition to the iNaturalist [github](https://github.com/visipedia/inat_comp/tree/master/2021) dataset to create a dataset of images mapped to audio.

## Helpful links
1. BirdSet [paper](https://arxiv.org/pdf/2403.10380v3) [github](https://github.com/DBD-research-group/BirdSet)can be used to identify other possible datasets where audio to image pairs exist or can be mapped.
2. Potential Augmentation techniques [1](https://ceur-ws.org/Vol-2125/paper_140.pdf)

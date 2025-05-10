import os
import random
import subprocess
import pandas as pd
from pathlib import Path

#required for ffmpeg
os.environ["PATH"] = os.path.abspath("../tools/ffmpeg") + ":" + os.environ["PATH"]

# Settings
csv_file = "ambience.csv"
output_directory = Path("../data/ambience/")
output_directory.mkdir(exist_ok=True)
tsv_file = "ambience.tsv"
clip_duration = 10
num_clips = 20

def get_video_duration(video_url):
    """Return the duration of a YouTube video in seconds."""
    result = subprocess.run(
        ["yt-dlp", "--get-duration", video_url],
        capture_output=True, text=True
    )
    duration_str = result.stdout.strip()
    h, m, s = map(int, duration_str.split(':')) if ':' in duration_str else (0, 0, int(duration_str))
    return h * 3600 + m * 60 + s

def generate_random_starts(duration, clip_len, n):
    """Generate non-overlapping random start times."""
    max_start = duration - clip_len
    possible_starts = list(range(0, max_start, clip_len))
    return random.sample(possible_starts, min(n, len(possible_starts)))

def download_clip(video_url, start, output_path):
    """Download a 10-second clip using yt-dlp and ffmpeg."""
    command = [
        "yt-dlp", "-f", "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4",
        "--external-downloader", "ffmpeg",
        "--external-downloader-args", f"-ss {start} -t {clip_duration}",
        "-o", str(output_path),
        video_url
    ]
    subprocess.run(command)

def main():
    df = pd.read_csv(csv_file)
    metadata = []

    for _, row in df.iterrows():
        video_id = row['id']
        caption = row['caption']
        video_url = f"https://www.youtube.com/watch?v={video_id}"

        print(f"Processing video: {video_id}")
        try:
            duration = get_video_duration(video_url)
        except Exception as e:
            print(f"Failed to get duration for {video_id}: {e}")
            continue

        start_times = generate_random_starts(duration, clip_duration, num_clips)

        for start in start_times:
            clip_name = f"{video_id}_{start:06d}.mp4"
            output_path = output_directory / clip_name
            print(f"Downloading clip: {clip_name}")
            try:
                download_clip(video_url, start, output_path)
                metadata.append({
                    'id': clip_name.replace('.mp4', ''),
                    'label': caption
                })
            except Exception as e:
                print(f"Failed to download clip {clip_name}: {e}")

    # Save metadata to TSV
    pd.DataFrame(metadata).to_csv(tsv_file, sep='\t', index=False)
    print(f"Saved metadata to {tsv_file}")

if __name__ == "__main__":
    main()

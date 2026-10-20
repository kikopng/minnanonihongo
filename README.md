# Minna Study Path

A static, mobile-friendly study site for a Minna no Nihongo–aligned course. It works on GitHub Pages: no server, accounts, database, or build step is required.

## What is ready

- `index.html` is the course map for Lessons 1–25.
- Lessons 1 and 15 now use the same reusable lesson application at `lesson.html`.
- Every published lesson is loaded only from its own `lessons/lesson-XX.json` data file.
- Lesson 1 includes 41 vocabulary cards, grammar, original reading/comprehension practice, exercises, and a private on-device writing area.
- `Exercise.htm` is retained only as a legacy backup; it is no longer linked from the course map.
- `lessons/SCHEMA.md` documents the data contract used by all lessons.

## Add Lesson 2 (or any new lesson)

1. Copy `lessons/lesson-template.json` to `lessons/lesson-02.json`.
2. Change the lesson number, title, and all lesson content.
3. In `lessons/course.json`, set Lesson 2 `status` to `ready`.
4. Open `index.html` and test it locally, then upload or commit the changed files to GitHub.

Use two digits in filenames: `lesson-01.json` through `lesson-25.json`.

## Give this prompt to another AI

> Create only `lessons/lesson-XX.json` for Minna Study Path. Copy the exact keys and array structure from `lessons/lesson-template.json` and obey `lessons/SCHEMA.md`. Use the Minna no Nihongo I second edition topic sequence. Write original explanations, readings, examples, and exercises; do not change `index.html`, `lesson.html`, `assets/`, `course.json`, or another lesson file. Use kanji and kana in their separate fields; romaji is optional and must not be required to learn the lesson. Keep the JSON valid.

## Publish to GitHub Pages

1. Create a GitHub repository and upload this entire folder.
2. In the repository, open **Settings → Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**, then choose `main` and the `/ (root)` folder.
4. Save. GitHub will show the public site link after deployment.
5. On your phone, open that link in a browser and choose **Add to Home Screen**.

## Content note

This project uses original explanations and exercises aligned with the course topics. Keep scans, official audio, and copied textbook dialogues out of the public repository unless you have permission to publish them.

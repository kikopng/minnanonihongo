# Minna Study Path

A static, mobile-friendly study site for a Minna no Nihongo–aligned course. It works on GitHub Pages: no server, accounts, database, or build step is required.

## What is ready

- `index.html` is the course map for Lessons 1–25.
- Lesson 1 is a complete interactive arcade: 42 vocabulary cards, five games, a detailed grammar guide, original reading/comprehension practice, and a private on-device writing area.
- `Exercise.htm` is retained unchanged as the existing Lesson 15 arcade and linked from the course map.
- `lesson.html` and `lessons/lesson-template.json` remain a lightweight viewer/template for ordinary study notes. The arcade is currently used by Lessons 1 and 15.

## Add Lesson 2 (or any new lesson)

1. Copy `lessons/lesson-template.json` to `lessons/lesson-02.json`.
2. Change the lesson number, title, and all lesson content.
3. In `lessons/course.json`, set Lesson 2 `status` to `ready`.
4. Open `index.html` and test it locally, then upload or commit the changed files to GitHub.

Use two digits in filenames: `lesson-01.json` through `lesson-25.json`.

## Give this prompt to another AI

> Create only `lessons/lesson-XX.json` for Minna Study Path. Copy the exact keys and array structure from `lessons/lesson-template.json`. Write original explanations, sentences, and exercises; do not change `index.html`, `lesson.html`, `assets/`, `course.json`, or other lesson files. Include at least 15 vocabulary items, 3 grammar points, 5 original example sentences, and 5 four-choice exercises. Keep all JSON valid.

## Publish to GitHub Pages

1. Create a GitHub repository and upload this entire folder.
2. In the repository, open **Settings → Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**, then choose `main` and the `/ (root)` folder.
4. Save. GitHub will show the public site link after deployment.
5. On your phone, open that link in a browser and choose **Add to Home Screen**.

## Content note

This project uses original explanations and exercises aligned with the course topics. Keep scans, official audio, and copied textbook dialogues out of the public repository unless you have permission to publish them.

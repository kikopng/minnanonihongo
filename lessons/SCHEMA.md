# Lesson data contract — version 2

Every published lesson is one UTF-8 JSON file named lesson-XX.json, where XX is a two-digit lesson number. The reusable application at lesson.html?lesson=XX reads this file; it contains no lesson-specific content in its page code.

Required top-level fields:

- schemaVersion: always 2.
- meta: number, title, edition, level, and one learner-centered objective.
- vocabulary: an array of cards. Each card needs id, kanji, kana, meaning, category, and an example with kanji, kana, and translation. Romaji is optional support text and is hidden by default.
- grammar: an array of pattern, explanation, and examples.
- reading: an original short dialogue or passage, English summary, and self-check questions.
- exercises: an array of four-option self-check questions. answer is the zero-based correct option index.
- writing: title, prompt, placeholder, and model answer.

Use lesson-template.json as the exact starting file. Do not modify the shared files in assets, lesson.html, or course.json when creating lesson content. When the lesson is complete, change only its matching entry in course.json from planned to ready.

## Quality rules

- Use native Japanese in kanji and kana fields. The viewer renders them with semantic ruby furigana.
- Write original explanations, examples, readings, and exercises. Do not copy a textbook dialogue or its exercise wording into a public site.
- Keep romaji only as an optional field; do not make it necessary to answer an exercise.
- Give every item a stable lowercase id; do not reuse IDs within a lesson.
- Test valid JSON before committing. A missing required field makes the lesson unavailable instead of silently rendering a broken page.

<!-- stm:v1 -->
## Session Memory

### User Instructions
- …

### Long Horizon Context
- …

### Decisions
- …

### Conclusions
- …

### Active References
- …

<existing_memory>
## Session Memory

### User Instructions
- …

### Long Horizon Context
- …

### Decisions
- …

### Conclusions
- …

### Active References
- …

<existing_memory>
## Session Memory

### User Instructions
- …

### Long Horizon Context
- …

### Decisions
- …

### Conclusions
- …

### Active References
- …

<existing_memory>
## Session Memory

### User Instructions
- …

### Long Horizon Context
- …

### Decisions
- …

### Conclusions
- …

### Active References
- …

<existing_memory>
## Session Memory

### User Instructions
- …

### Long Horizon Context
- …

### Decisions
- …

### Conclusions
- …

### Active References
- …

<existing_memory>
## Session Memory

### User Instructions
- None captured yet.

### Long Horizon Context
- None captured yet.

### Decisions
- None captured yet.

### Conclusions
- None captured yet.

### Active References
- None captured yet.

</existing_memory>

<conversation_update>
USER:
fix build

---

ASSISTANT:
Build fixed. Cause: `INFOPLIST_FILE` pointed `SwiftBookVIPER/Info.plist`, real file `SwiftBookVIPER/Supporting Files/Info.plist`. Updated target setting both configs. Rebuild: success, 0 errors.
</conversation_update>

</existing_memory>

<conversation_update>
USER:
fix outlets linkage

---

USER:
▣ DCP | -23.8K removed, +134 summary

│⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿█████████████████████│
▣ Compression #1 -23K removed, +134 summary
→ Topic: Fix missing Info.plist build
→ Items: 13 messages and 18 tools compressed
</conversation_update>

</existing_memory>

<conversation_update>
ASSISTANT:
Outlets fixed. Storyboard pointed `customModule="SwiftbookApp"`, target module `SwiftBookVIPER`. All 3 classes failed load → nil outlets.

Changed `customModule` to `SwiftBookVIPER` in `Main.storyboard`:
- `CourseListViewController`
- `CourseTableViewCell`
- `CourseDetailsViewController`

Existing `tableView`, `courseImage`, `courseNameLabel`, `numberOfLessonsLabel`, `numberOfTestsLabel`, `favoriteButton`, `toggleFavorite:`, `dataSource`/`delegate`, `ShowDetails` links left intact.

Build clean, 0 errors.
</conversation_update>

</existing_memory>

<conversation_update>
USER:
why labels in Main.storyboard CourseDetailsViewController are white on white?

---

ASSISTANT:
No `textColor` set. All 3 labels default adaptive:

- `Main.storyboard:79,84,92` — `nil textColor` → `labelColor` (black light / white dark)
- `Main.storyboard:114` — view fixed `white=1`
- Canvas `appearance=light` hides bug — IB shows black-on-white

Dark Mode runtime → white labels on fixed white background → invisible.

Fix: explicit black `textColor`, or adaptive `systemBackground` + `labelColor`. Say word, patch.
</conversation_update>

</existing_memory>

<conversation_update>
USER:
ty, found static white color lol, mentor smh

---

ASSISTANT:
Yeah. Static white + dynamic label = classic. Mentor tax collected.

Say word if want adaptive colors patch.
</conversation_update>

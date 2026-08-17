# routine_rehearsal

Project 9 from the Loop Engineering crash course.

## All Commands

### Reset (clean start)

```powershell
.\reset.ps1
```

**Reason:** Remove old transcripts, summaries, and results so the next run starts clean.

**Result:** Prints `Reset routine_rehearsal...` and clears old output files.

---

### Run one-off (success)

```powershell
.\fire-once.ps1 -Mode success
```

**Reason:** Fire the routine once. The task summarizes git commits onto the `claude/summary` branch.

**Result:**

```
Status column: GREEN (session completed)
Mode: success
Result: commit-summary.md written on branch 'claude/summary' with N commit(s)
```

Popup appears and stays open until you click OK.

---

### Run one-off (failure)

```powershell
.\fire-once.ps1 -Mode failure
```

**Reason:** Fire the routine once, but the task must fail (reads a missing file).

**Result:**

```
Status column: GREEN (session completed)
Mode: failure
Result: FAILED: Cannot find path '...does-not-exist.txt' because it does not exist.
```

Popup appears and stays open until you click OK.

---

### Run both back to back

```powershell
.\rehearse.ps1
```

**Reason:** Run success first, then failure, in one command.

**Result:** Both transcripts shown, success in green, failure in red.

---

### Register daily automation (extra)

```powershell
.\setup-daily.ps1
```

**Reason:** Create a daily Task Scheduler job at 19:45 (extra, not part of the core rehearsal).

**Result:** Prints `Daily task 'RoutineRehearsalDaily' created for 19:45.`

---

## The Lesson

The status column says GREEN in both cases. Only the transcript shows the real result.

Green means the session ended without an infrastructure error, nothing more.

---

## All Loop Engineering Projects

| # | Project | Repo |
|---|---|---|
| 1 | A Watch Loop | `eng-loop-a_watch_loop` |
| 2 | Make the tests pass, then stop | `eng-loop-pass_stop` |
| 3 | The morning brief with a memory | `eng-loop-morning_brief` |
| 4 | A fix loop with a real checker | `eng-loop-fix_loop` |
| 5 | Codify the body | `eng-loop-fix_loop5` |
| 6 | The doorbell loop | `doorbell-loop` |
| 7 | Break it on purpose | `eng-loop-break_it` |
| 8 | Your own daily loop (capstone) | `eng-loop-daily_loop` |
| 9 | Rehearse a routine for free | `eng-loop-routine_rehearsal` |

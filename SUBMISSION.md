# ForgeHacks 2026 Submission Pack

## 1. Project title and short description
**Title:** AI Testbench Studio

**Short description (one paragraph):** Hardware students struggle to verify their Verilog designs because writing a testbench is hard and a failing simulation does not say who is wrong. AI Testbench Studio lets you upload RTL, uses an LLM to write a self-checking testbench, compiles and simulates it with Icarus Verilog, repairs compile errors automatically, and, when checks fail, tells you whether the testbench or your design has the bug.

**One-liner:** From RTL to verified, with an AI that debugs itself.

## 2. Track selection
**AI + Education.** (Confirm the exact wording against the six official tracks on the ForgeHacks submission form.)

## 3. Public demo video (2-4 minutes)
- Script: `DEMO_VIDEO_SCRIPT.md` (3:00).
- Upload to YouTube as **Public** or **Unlisted** (confirm which the rules allow).
- Suggested YouTube title: `AI Testbench Studio: AI writes and debugs Verilog testbenches | ForgeHacks 2026`
- Suggested YouTube description:
```
AI Testbench Studio turns a Verilog file into a self-checking testbench, runs it with Icarus Verilog, auto-fixes compile errors, and tells you whether a failure is a testbench mistake or a real RTL bug.
Track: AI + Education | ForgeHacks 2026
GitHub: <your-repo-url>
Chapters: 0:00 Problem | 0:25 Solution | 0:50 Demo: passing design | 1:40 Demo: AI finds RTL bug | 2:20 Waveform | 2:40 Impact
```

## 4. GitHub repository
Contents: `ai_tb_studio.py`, `README.md`, `demo/`, `docs/` (screenshots + architecture PNG), `LICENSE`.
Commands:
```powershell
git init
git add .
git commit -m "AI Testbench Studio - ForgeHacks 2026"
git branch -M main
git remote add origin <your-repo-url>
git push -u origin main
```
Before pushing: make sure no API key is saved anywhere in the code or screenshots.

## 5. Written project description

**Problem statement and target users.** Verification is a major part of hardware design, yet it is the part newcomers are least prepared for. Students and hobbyists writing Verilog for FPGAs or RISC-V cores often skip testbenches because writing them requires knowing timing, reference models, and tool flags. When a simulation fails, beginners cannot tell whether their design or their testbench is wrong, which makes verification discouraging. Our users are digital-design students, self-taught FPGA/RISC-V builders, and instructors who need quick, correct verification examples.

**Technical approach and components.**
- *Prompt engineering:* a strict testbench prompt (timescale, module `tb`, reference model that follows the RTL's literal semantics, wait before checking, bounded run length, only first 10 FAIL lines, final `SUMMARY:` line, VCD dump, watchdog).
- *Closed-loop tool use:* generated code is compiled with `iverilog -g2012` and run with `vvp`; compiler/runtime errors are fed back to the model for repair, up to a configurable number of retries.
- *Verdict reasoning:* when checks fail, a second prompt asks the model to classify the failure as `TB_ERROR` (and return a corrected testbench) or `RTL_BUG` (with an explanation), biased to be conservative about blaming the RTL.
- *Sanity guards:* detects simulations that end at time 0, hit the watchdog, or contain no checks, so a silent "pass" is never reported.
- *Provider-agnostic backend:* Gemini REST, OpenAI-compatible APIs (Groq, Hugging Face, OpenRouter) and local Ollama, with retry/backoff on rate limits.
- *Tooling:* Python 3 and Tkinter (standard library only), Icarus Verilog, GTKWave with an auto-generated signal save file.

**Real-world impact.** It lowers the barrier to hardware verification: a student gets a working testbench, live results, and a plain-English explanation of failures in minutes, which teaches good verification habits instead of replacing them. Free-tier and fully offline (Ollama) options make it usable in classrooms with limited budgets or connectivity. For small teams and open-source RISC-V projects it removes boilerplate so engineers focus on hard corner cases. Because the AI's work is checked by a real simulator rather than trusted blindly, results are verifiable.

## 6. Screenshots and architecture diagram
Capture these (Win + Shift + S) into `docs/`:
1. `01_main_window.png`: app open with `alu8.v` loaded in the RTL tab.
2. `02_generated_testbench.png`: Testbench tab after generation.
3. `03_all_pass.png`: Simulation output showing green "all checks passed".
4. `04_rtl_bug_verdict.png`: red "AI VERDICT: likely RTL BUG" for the buggy counter.
5. `05_waveform.png`: GTKWave with signals visible.
6. `architecture.png`: export slide 4 of the deck (PowerPoint: File > Export > PNG) or render the Mermaid diagram from the README.
No deployment link is needed for a desktop app; the GitHub repo plus video covers testing.

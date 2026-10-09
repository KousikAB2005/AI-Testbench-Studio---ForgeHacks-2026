# Demo Video Script (target 3:00, limit 4:00)

**Recording setup:** OBS or Loom, 1080p, mic check, close other windows, hide the API key (paste it before recording, or use Ollama). Pre-run once so models are warm. Slides = `AI_Testbench_Studio_Deck.pptx` (present in slideshow mode, alt-tab to the app for demos). Speaker notes in the deck contain this narration.

| Time | Screen | Say |
|---|---|---|
| 0:00-0:25 | Slide 1 then Slide 2 (Problem) | "Hi, I'm [name]. Writing a testbench takes as long as writing the design, and when a simulation fails, beginners can't tell who is wrong: the testbench or their Verilog. So many students skip verification altogether." |
| 0:25-0:50 | Slide 3 then Slide 4 (pipeline) | "AI Testbench Studio fixes that. Upload RTL, an LLM writes a self-checking testbench, Icarus Verilog compiles and simulates it, the AI repairs compile errors, and if checks fail it tells you whether the testbench or your design is at fault. Let me show you." |
| 0:50-1:05 | App: click Upload RTL, pick `alu8.v`; show provider and model | "I'll load a simple 8-bit ALU. I'm using [provider]. You can also use Gemini, Groq, or a local offline model with Ollama." |
| 1:05-1:40 | Click Generate TB + Simulate; Simulation output tab | "One click. The AI writes the testbench, we compile and simulate. Notice the log: compile, simulation, and the result, 'all checks passed'. If a compile error happens, it's sent back to the AI automatically." Show the Testbench tab briefly: "It's editable, with directed corner cases and random vectors." |
| 1:40-2:20 | Upload `buggy_decade_counter.v`, Generate + Simulate; show red verdict | "Now a design with a planted bug: a decade counter that should wrap at 9 but wraps at 10. Watch: checks fail, and instead of blindly changing the testbench, the AI decides. Verdict: RTL bug, with an explanation. That's the moment a beginner learns something." |
| 2:20-2:40 | Click Open waveform; GTKWave shows signals | "And everything is inspectable: one click opens GTKWave with the signals already listed." |
| 2:40-3:00 | Slide 7 (Impact) then Slide 8 (links) | "It's free to run, works offline, and the AI's work is checked by a real simulator, not trusted blindly. Built for ForgeHacks, AI plus Education. Code is on GitHub. Thanks for watching." |

## Tips
- If the model is slow, speed up (cut) the waiting in editing, but keep the real result visible.
- If the AI blames the testbench instead of the RTL on the buggy counter, re-run once; it uses low temperature, but models vary.
- Keep a backup recording of a successful run.
- Upload to YouTube, add the description from `SUBMISSION.md`, and test the link while logged out.

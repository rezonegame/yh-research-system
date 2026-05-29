---
name: research-qa-loop
description: 对研究产出执行 critic/fixer 迭代审查，直到达到质量门槛或触发阻断。
---

# research-qa-loop

## 目标

通过多轮审查-修复提升研究产出质量，避免低质量直接交付。

## 执行规范

1. 先推荐 1-2 个相关 Skills（如 scientific-critical-thinking, technical-writer）。
2. 进行质量评分（研究严谨性、结构、证据、可复现性、可用性）。
3. 若低于门槛，给出最小修复清单。
4. 修复后复评，最多 5 轮。
5. 输出最终结论：通过 / 未通过 + 原因。

## 门槛

- 80：可提交
- 90：可发布
- 95：卓越
- 60：探索态（仅探索目录）

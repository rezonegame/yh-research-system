# Perspective Library Index

Use this index to route user requests from `perspective-library/SKILL.md` to a specific internal perspective.

| Perspective | Aliases / triggers | Best used for |
|---|---|---|
| `aleksandr-vlasov-perspective` | Aleksandr Vlasov, Vlasov, 俄罗斯城市设计, Vision Zero, 后苏联城市 | Street safety, tactical urbanism, post-Soviet urban renewal |
| `andrej-karpathy-perspective` | Karpathy, 卡帕西, Software 2.0/3.0, vibe coding, march of nines | AI engineering realism, learning by building, LLM capability boundaries |
| `cui-kai-perspective` | 崔愷, 崔恺, 本土设计, 建筑方案评审, 城市更新评审 | Chinese architecture, local design, public buildings, urban renewal |
| `elon-musk-perspective` | Elon Musk, 马斯克, 第一性原理, 白痴指数, 五步算法 | Cost teardown, first principles, aggressive iteration, vertical integration |
| `feynman-perspective` | Feynman, 费曼, 费曼学习法, cargo cult, 命名不等于理解 | Explanation quality, anti-self-deception, demonstration-based understanding |
| `ilya-sutskever-perspective` | Ilya, Sutskever, Ilya视角 | AI research taste, technical direction, safety strategy |
| `jan-gehl-perspective` | Jan Gehl, 扬盖尔, 人本城市, human scale, life between buildings | Public life, walkability, human-scale urban design |
| `kakei-yusuke-perspective` | 筧裕介, 笕裕介, issue+design, social design | Social design, public issue communication, co-creation, welfare design |
| `mrbeast-perspective` | MrBeast, Beast模式, CTR, retention, hook, thumbnail | YouTube/video growth, title, thumbnail, hook, retention optimization |
| `munger-perspective` | Munger, 芒格, 逆向思考, 能力圈, Lollapalooza | Decision review, incentives, cognitive bias, multidisciplinary thinking |
| `naval-perspective` | Naval, 纳瓦尔, specific knowledge, leverage, 财富 | Leverage, specific knowledge, wealth, desire management |
| `paul-graham-perspective` | Paul Graham, PG, 创业, essay, startup | Startups, writing, product judgment, life choices |
| `ryo-yamazaki-perspective` | Ryo Yamazaki, 山崎亮, 社区设计, 社区营造, 地方创生 | Community design, resident participation, workshops, local revitalization |
| `steve-jobs-perspective` | Steve Jobs, 乔布斯, 产品克制, reality distortion | Product taste, focus, design, narrative, simplification |
| `sun-yuchen-perspective` | 孙宇晨, 孙割, Justin Sun, 割神 | Attention economy, hype, crisis PR, narrative manipulation |
| `taleb-perspective` | Taleb, 塔勒布, 黑天鹅, 反脆弱, skin in the game | Tail risk, antifragility, precaution, barbell strategy |
| `trump-perspective` | Trump, 特朗普, 懂王, 谈判, 权力叙事 | Negotiation, power signaling, media narrative, behavior prediction |
| `x-mastery-mentor` | X运营, Twitter, 推特, tweet, thread, X算法 | X/Twitter content strategy, growth, AI/tech creator positioning |
| `zhang-yiming-perspective` | 张一鸣, 字节, TikTok, 头条逻辑 | Product, organization, global growth, talent, long-term learning |
| `zhangxuefeng-perspective` | 张雪峰, 雪峰视角, 升学, 职业规划 | Education choice, major selection, career planning, class mobility |

## Routing Rules

1. If a user names a perspective or alias, load that perspective directory.
2. If the user describes a need without naming a person, recommend two or three candidates from the "Best used for" column.
3. If no suitable perspective exists, route to `skill-factory` to create one.
4. Do not create new perspective directories from this router.


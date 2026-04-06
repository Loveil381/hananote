# HanaNote — 竞品分析
> 最后更新: 2026-04-06 | 会话轮次: #46

## 竞品概览
| 竞品 | 平台 | 用户量 | 核心能力 | 我们的优势 |
|------|------|--------|----------|-----------|
| Shotlee | iOS/Android/Web | 25K+ | 注射追踪+血检+AI洞察 | 无CJK语言/无加密/非Trans专属 |
| Trans Memo | Android | 51K+ | 用药+心情+睡眠+库存 | 无血检/PK/照片/亚洲语言 |
| PatchDay | iOS (开源) | 小 | 贴片轮换+Widget | 功能单一/无中日文/无Android |
| Hormone Helper | iOS | - | 药库+医生模板+教育视频 | 无Android/无加密/无亚洲语言 |
| TRACE | iOS/Android | - | 照片+语音+社区 | 已停运/云依赖/隐私风险 |
| estrannaise.js | Web | - | 3室PK+MCMC | 纯Web/无App/无其他功能 |
| TFS Simulator | Web | - | 注射E2模拟 | 只支持注射 |

## 关键发现（2026-04-06 搜索）
1. **零竞品提供亚洲语言支持** — HanaNote 独占 CJK+SEA 市场
2. **零竞品达到我们的加密级别** — Argon2id+AES-256-GCM+SQLCipher
3. **PK 双引擎在消费级 App 中全球唯一**
4. Shotlee 25K 用户 + Trans Memo 51K 安装 = 市场需求已验证

## 我们的差异化
1. 全功能整合（用药+验血+围度+拍照+PK模拟+日记+时间线）
2. 极致隐私（加密全栈+伪装+紧急清除+离线优先）
3. 中日英三语（面向中日东南亚华人圈）
4. 二次元审美系统（樱色+毛玻璃+无边框设计）
5. PK 双引擎（V2 + Hana-PK 实验引擎）

## 值得借鉴
| 来源 | 功能 | 优先级 | 状态 |
|------|------|--------|------|
| PatchDay | Home Screen Widget（下次用药时间） | P2 | ⏳ 待规划 |
| Hormone Helper | 医生沟通模板 | P3 | ⏳ 待评估 |
| PatchDay/Shotlee | 注射部位轮换追踪 | P3 | ⏳ 待评估 |
| Hormone Helper | 教育视频/Onboarding | P1 | ⏳ 待设计 |
| Trans Memo | 隐蔽通知模式 | P2 | ✅ 已实现（vague通知） |
| estrannaise.js | 3室PK+MCMC | - | ✅ 已参考（Hana-PK引擎） |
| TRACE | 里程碑庆祝 | P3 | ⏳ 待评估 |

## 我们远景中缺失的关键能力
1. **Onboarding/教育内容** — 所有成功竞品都有，我们没有
2. **Home Screen Widget** — 高频触点，PatchDay 已验证价值
3. **注射部位管理** — 注射用户刚需

## PK 模拟器关键参考
- GitHub: https://github.com/WHSAH/estrannaise.js
- TFS: https://transfemscience.org/misc/injectable-e2-simulator/
- 三室模型+衰减基线方法优于TFS的简单偏移

# Neovim Markdown 速查表

> 为此项目配置的Markdown编辑完整指南

---

## 🎯 核心快捷键

### Markdown专属
| 快捷键 | 功能 |
|--------|------|
| `<leader>um` | 切换渲染效果 |
| `<leader>ms` | 切换拼写检查 |
| `<leader>mn` | 下一个拼写错误 |
| `<leader>mp` | 上一个拼写错误 |
| `z=` | 显示拼写建议 |

### 结构导航
| 快捷键 | 功能 |
|--------|------|
| `<leader>o` | 打开/关闭大纲视图（Aerial） |
| `]]` | 跳转到下一个标题 |
| `[[` | 跳转到上一个标题 |
| `]c` | 跳转到下一个代码块 |

### 文本编辑
| 快捷键 | 功能 |
|--------|------|
| `gcc` | 注释/取消注释 |
| `gcj` | 注释下一行 |
| `gck` | 注释上一行 |
| `<C-s>` | 保存文件 |

### LSP 导航（通用）
| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 |
| `gr` | 查找引用 |
| `K` | 显示悬停文档 |
| `gi` | 跳转到实现 |
| `<leader>ca` | 代码操作菜单 |
| `<leader>cr` | 重命名符号 |
| `<leader>cf` | 格式化代码 |

### LSP 符号浏览
| 快捷键 | 功能 |
|--------|------|
| `<leader>ss` | 搜索文档符号 |
| `<leader>sS` | 搜索工作区符号 |
| `<leader>cs` | 显示符号列表 |
| `[d` | 上一个诊断 |
| `]d` | 下一个诊断 |
| `<leader>cd` | 显示诊断详情 |

---

## 💡 高效编写技巧

### 1. 快速操作模式
```
v (可视模式) → 选择文本后：
    c → 加粗
    i → 斜体
    s → 删除线
    l → 创建链接
```

### 2. 列表智能操作
在列表项中：
- `<Tab>` → 增加缩进
- `<Shift-Tab>` → 减少缩进
- `<Enter>` → 创建新列表项
- `<Shift-Enter>` → 退出列表

### 3. 拼写检查实用操作
```
z=  → 查看拼写错误建议
zg  → 将单词添加到字典
zw  → 将单词从字典移除
zug → 撤销最近的添加操作
```

---

## 🎨 Wiki链接

> 注意：如需智能补全和跳转，需安装 marksman LSP

### 基本语法
```markdown
[[文件名]]                    → 链接到同级文件
[[../父目录/文件名]]          → 链接到上级目录
[[path/to/file]]              → 链接到指定路径
[[文件名#标题]]               → 链接到特定章节
[[文件名|显示文本]]           → 自定义显示文本
```

---

## 🔧 配置说明

### 已自动启用的功能
- ✅ 自动换行（软换行）
- ✅ 拼写检查（英文+中文）
- ✅ Markdown 渲染增强（render-markdown）
- ✅ 代码大纲（Aerial）
- ✅ LSP 支持（通过 LazyVim）

### 自动格式化
打开`.md`文件时自动应用：
```vim
wrap = true           -- 启用自动换行
linebreak = true      -- 在单词边界换行
textwidth = 0         -- 不自动硬换行
conceallevel = 2      -- 隐藏链接URL
spell = true          -- 启用拼写检查
spelllang = {"en", "cjk"}  -- 英文+中文检查
```

---

## 📋 文档模板

### 标准文档模板
```markdown
# 文档标题

## 简介
简要描述文档内容和目的

## 目录
- [功能特性](#功能特性)
- [使用说明](#使用说明)
- [示例代码](#示例代码)
- [注意事项](#注意事项)

## 功能特性
- 特性1说明
- 特性2说明

## 使用说明
### 前置条件
列出需要的环境和依赖

### 安装步骤
1. 步骤1
2. 步骤2

## 示例代码
\```bash
# Bash示例
command arg1 arg2
\```

\```python
# Python示例
def function():
    pass
\```

## 注意事项
> 注意事项内容

## 参考资料
- [参考链接1](https://example.com)
- [参考链接2](./other-doc.md)
```

---

## 🔍 故障排查

### 拼写检查问题
```vim
:spell          → 查看拼写检查状态
:set spelllang=en  → 仅检查英文
:set spelllang=    → 关闭拼写检查
```

### 渲染效果不理想
```
<leader>um    → 切换渲染开关
```

---

## 📊 插件说明

### 核心插件
- **render-markdown.nvim** - Markdown 增强渲染
- **aerial.nvim** - 代码大纲
- **nvim-treesitter** - 语法高亮支持
- **nvim-lspconfig** - LSP 客户端配置
- **telescope.nvim** - 模糊搜索（符号搜索等）

### 功能概览
| 功能 | 插件 | 说明 |
|------|------|------|
| 渲染增强 | render-markdown | 高亮标题、列表、代码块 |
| 代码大纲 | aerial | 结构化视图和导航 |
| 拼写检查 | vim 内置 | 英文+中文检查 |
| 符号搜索 | telescope + lsp | 跨文件符号查找 |
| 定义跳转 | lspconfig | 跨文件定义跳转 |

### LSP 符号类型
LSP 能识别的 Markdown 符号包括：
- **Heading** (H1-H6) - 各级标题
- **Link** - 链接定义
- **Reference** - 引用位置

> 💡 如需更强大的 Markdown LSP 功能（Wiki 链接补全、交叉引用），可安装 marksman

---

## 📚 更多资源

### 学习资源
- [Markdown基础语法](https://www.markdownguide.org/basic-syntax/)
- [GitBook Markdown指南](https://docs.gitbook.com)
- [marksman文档](https://github.com/artempyanykh/marksman)

### 快捷键记忆技巧
- `m` → Markdown
- `s` → Spell（拼写）
- `n` → Next（下一个）
- `p` → Previous（上一个）
- `um` → Unset Markdown（切换渲染）

---

**版本**: 1.1
**更新日期**: 2025-01-21
**配置文件**: `lua/plugins/markdown.lua`, `lua/config/options.lua`

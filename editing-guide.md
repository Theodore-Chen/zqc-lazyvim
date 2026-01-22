# Neovim 配置与使用指南

> 为此项目配置的 Neovim 完整指南

---

## 目录

- [插件配置文件](#插件配置文件)
- [Markdown 编辑](#markdown-编辑)
- [快捷键分类](#快捷键分类)
  - [Clangd (C++ 开发)](#clangd-c-开发)
  - [CMake 工具](#cmake-工具)
  - [调试 (DAP)](#调试-dap)
  - [Git 操作](#git-操作)
  - [搜索与替换](#搜索与替换)
  - [文件信息](#文件信息)
- [配置说明](#配置说明)
- [常见问题](#常见问题)

---

## 插件配置文件

| 文件 | 功能 |
|------|------|
| `lua/plugins/clangd.lua` | clangd LSP + clangd_extensions 配置 |
| `lua/plugins/lsp.lua` | LSP 通用配置（禁用 inlay hints） |
| `lua/plugins/dap.lua` | DAP 调试配置（GDB） |
| `lua/plugins/theme.lua` | 主题配置 |
| `lua/plugins/search.lua` | grug-far 搜索替换配置 |
| `lua/plugins/copy-filename.lua` | 复制文件名配置 |
| `lua/plugins/markdown.lua` | Markdown 编辑配置 |
| `lua/plugins/cmake-tools.lua` | CMake 工具配置 |
| `lua/plugins/diffview.lua` | Git Diff 查看配置 |

---

## Markdown 编辑

### 核心快捷键

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

### 快速操作模式

```
v (可视模式) → 选择文本后：
    c → 加粗
    i → 斜体
    s → 删除线
    l → 创建链接
```

### Wiki 链接语法

```markdown
[[文件名]]                    → 链接到同级文件
[[../父目录/文件名]]          → 链接到上级目录
[[path/to/file]]              → 链接到指定路径
[[文件名#标题]]               → 链接到特定章节
[[文件名|显示文本]]           → 自定义显示文本
```

---

## 快捷键分类

### Clangd (C++ 开发)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<leader>ca` | AST 可视化 | 查看代码语法树 |
| `<leader>cs` | Symbol Info | 查看符号详细信息 |
| `<leader>ct` | Type Hierarchy | 查看类型继承关系 |
| `<leader>cm` | Memory Usage | 查看 clangd 内存占用 |
| `<leader>ch` | Switch Header | 在 .h 和 .cpp 之间切换 |
| `<leader>ci` | Toggle Hints | 切换 inlay hints 显示 |

### CMake 工具

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<leader>mg` | Generate | 生成 CMake 配置 |
| `<leader>mb` | Build | 构建项目 |
| `<leader>mB` | Build File | 构建当前文件 |
| `<leader>mt` | Select Target | 选择构建目标 |
| `<leader>mk` | Select Kit | 选择工具链 |
| `<leader>mr` | Run | 运行程序 |
| `<leader>mR` | Run File | 运行当前文件 |
| `<leader>md` | Debug | 调试程序 |
| `<leader>mD` | Debug File | 调试当前文件 |
| `<leader>ms` | Stop | 停止运行/调试 |
| `<leader>mE` | Edit Cache | 编辑 CMake 缓存 |

### 调试 (DAP)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<leader>db` | Toggle Breakpoint | 设置/取消断点 |
| `<leader>dB` | Conditional Breakpoint | 条件断点 |
| `<leader>dc` | Continue | 继续运行 |
| `<leader>dC` | Run to Cursor | 运行到光标处 |
| `<leader>dg` | Go to Line | 跳转到指定行 |
| `<leader>di` | Step Into | 单步进入 |
| `<leader>do` | Step Over | 单步跳过 |
| `<leader>dO` | Step Out | 单步跳出 |
| `<leader>dp` | Pause | 暂停 |
| `<leader>dr` | REPL | 打开调试控制台 |
| `<leader>dt` | Terminate | 终止调试 |
| `<leader>dw` | DAP UI | 切换调试界面 |

**命令**：

- `:DapLaunch` - 启动调试
- `:DapLaunchFile` - 调试当前文件（build/目录）

### Git 操作

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<leader>gv` | Diff View | 查看当前变更 |
| `<leader>gc` | File History | 查看文件历史 |
| `<leader>gC` | Current File History | 查看当前文件历史 |

**Diffview 操作**：

- `Tab` / `Shift+Tab` - 在文件之间跳转
- `Enter` - 展开查看详细 diff
- `q` - 关闭
- `]c` / `[c` - 下一个/上一个变更

### 搜索与替换 (grug-far)

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<leader>sg` | Search | 搜索当前目录 |
| `<leader>sG` | Search (Root) | 搜索项目根目录 |
| `<leader>sw` | Search Word | 搜索单词/选中文本 |

**grug-far 窗口内快捷键** (`<localleader>` = `\`)：

- `\s` - 切换到 Search 输入框
- `\r` - 切换到 Replace 输入框
- `\f` - 切换到 Files 输入框（目录过滤）
- `\n` / `\p` - 下一个/上一个匹配
- `\q` - 关闭窗口

**目录过滤语法**：

```
src/**/*.cpp        # 只搜索 src 下所有 .cpp 文件
!build/**           # 排除 build 目录
src/ !test/         # 只搜索 src，排除 test
```

### 文件信息

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<leader>yf` | Copy Filename | 复制文件名（如 `main.cpp`） |
| `<leader>yF` | Copy Relative Path | 复制相对路径（如 `src/utils/main.cpp`） |
| `<leader>yp` | Copy Full Path | 复制绝对路径 |
| `<leader>yi` | File Info | 显示文件完整信息 |

**路径计算规则**：

- 优先使用 git 根目录作为基准
- 如果没有 git，使用当前工作目录
- 否则使用完整路径

### 其他有用的快捷键

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<leader>ff` | Find Files | 搜索文件名（Telescope） |
| `<leader>fb` | Buffers | 查看打开的缓冲区 |
| `<leader>cf` | Format | 格式化代码（LazyVim 内置） |

---

## 配置说明

### Inlay Hints（类型提示）

已全局禁用 inlay hints。如需临时启用：

```vim
<leader>ci
```

### 主题切换

编辑 `lua/plugins/theme.lua` 第 4 行：

```lua
local theme = "vscode"  -- 可选: "vscode", "tokyonight", "onedark"
```

### GDB 调试器

使用的 GDB 路径：`/usr/local/binutils-2_45/bin/gdb`

---

## 常见问题

### Q: grug-far 搜索结果不显示？

A: 确保安装了 ripgrep：`sudo apt install ripgrep`

### Q: DAP 调试无法启动？

A: 确保编译时包含调试信息：`g++ -g -o program main.cpp`

### Q: 如何查看所有快捷键？

A: 按 `<leader>sk` 打开快捷键搜索（Telescope keymaps）

### Q: 拼写检查问题？

A: 使用 `:spell` 查看状态，`:set spelllang=en` 仅检查英文

---

## 插件说明

### 核心插件

- **render-markdown.nvim** - Markdown 增强渲染
- **aerial.nvim** - 代码大纲
- **grug-far.nvim** - 搜索和替换
- **clangd_extensions.nvim** - C++ AST、类型层次等
- **cmake-tools.nvim** - CMake 项目管理
- **nvim-dap.nvim** - 调试支持
- **diffview.nvim** - Git diff 查看
- **nvim-osc52** - SSH 环境剪贴板支持

### 功能概览

| 功能 | 插件 | 说明 |
|------|------|------|
| Markdown 渲染 | render-markdown | 高亮标题、列表、代码块 |
| 代码大纲 | aerial | 结构化视图和导航 |
| 搜索替换 | grug-far | 类似 VSCode 的搜索体验 |
| C++ 开发 | clangd | LSP + AST + 类型层次 |
| 项目构建 | cmake-tools | CMake 集成 |
| 调试 | nvim-dap | GDB 调试支持 |
| Git 操作 | diffview | 可视化 diff 查看 |

---

## 更多资源

### 学习资源

- [Markdown基础语法](https://www.markdownguide.org/basic-syntax/)
- [GitBook Markdown指南](https://docs.gitbook.com)
- [LazyVim 文档](https://lazyvim.github.io/)
- [grug-far 文档](https://github.com/MagicDuck/grug-far.nvim)

### 快捷键记忆技巧

- `m` → Make（CMake）或 Markdown
- `d` → Debug（调试）
- `g` → Git
- `s` → Search（搜索）
- `y` → Yank（复制）
- `c` → Code（代码操作）

---

**版本**: 2.0
**更新日期**: 2025-01-22
**配置目录**: `~/.config/nvim/`

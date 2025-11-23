-- PHP SNIPPET CUSTOM SNIPPET
--vim.keymap.set("n", ",h", "i<?php<CR><CR><CR><CR>?><Esc>3kI", { noremap = true, silent = true })
vim.keymap.set("n", ",h", "i<?php<CR><CR>declare(strict_types=1);<CR><CR><Esc>I", { noremap = true, silent = true })
vim.keymap.set("n", ",i", "i<?=    ?><Esc>3hi", { noremap = true, silent = true })
vim.keymap.set("n", ",o", "o<?=   ?><Esc>3hi", { noremap = true, silent = true })
vim.keymap.set("n", ",s", "xi><?=    ?><Esc>3hi", { noremap = true, silent = true })



-- CUSTOM SNIPPETS

-- THIS IS HEADER ON ANY FILE
-- 1: Full PHP Header Block
vim.keymap.set("n", ",1",
    "o<Esc>o/**<CR>========================================<CR>AUTHOR: Muzammil Hassan (aka Zephyr)<CR>GITHUB: https://github.com/mmuzammilhassan<CR>LINKEDIN: https://linkedin.com/in/mmuzammilhassan/<CR>EMAIL: m.muzammil.hassan.dev@gmail.com<CR><CR>PROJECT: Zephyr Framework<CR>LICENSE: MIT<CR>DESCRIPTION: Small project or script info (optional)<CR>========================================<CR>*/<CR><Esc>kvwws*<Esc>",
    { noremap = true, silent = true }
)

-- 2: Full PHP header block (docblock style, recommended)
-- THIS IS FOOTER ON ANY FILE
vim.keymap.set("n", ",2", [[Go/**
================================================
 ____  ____  ____  _   _  _  _  ____
(_   )( ___)(  _ \( )_( )( \/ )(  _ \
 / /_  )__)  )___/ ) _ (  \  /  )   /
(____)(____)(__)  (_) (_) (__) (_)\_)

AUTHOR:  Muzammil Hassan (aka Zephyr)
GITHUB:  https://github.com/mmuzammilhassan
================================================
*/<Esc>8kbi <Esc>3jx2jxjxjh2xj2lcF*<Esc>]], { noremap = true, silent = true })
--**/<Esc>7kbi <Esc>3jx2jxjxjxcF*<Esc>2li<CR><Esc>r*]], { noremap = true, silent = true })
--**/<Esc>7kbi <Esc>3jx2jxjx]], { noremap = true, silent = true })
--**/<Esc>]], { noremap = true, silent = true })
--
-- 3: Full PHP Header Block
vim.keymap.set("n", ",3",
    "o<Esc>o/**<CR>========================================<CR>AUTHOR: Muzammil Hassan (aka Zephyr)<CR>PROJECT: Zephyr Framework<CR>LICENSE: MIT<CR>========================================<CR>*/<CR><Esc>kvwws*<Esc>",
    { noremap = true, silent = true }
)

-- 4: Compact one-liner
vim.keymap.set("n", ",4",
    "i// Author: Muzammil Hassan | GitHub: mmuzammilhassan | LinkedIn: mmuzammilhassan<CR><Esc>ddj<Esc>",
    { noremap = true, silent = true }
)


-- ⚡ PRO TIP:
-- You can even mix styles:
-- Top → only project/license info (short).
-- Bottom → personal signature, ASCII art, etc.
--
-- Example hybrid:
-- 
-- <?php
-- declare(strict_types=1);
-- 
-- /**
--  * PROJECT:  Zephyr Framework
--  * LICENSE:  MIT
--  */
-- 
-- session_start();
-- 
-- // your code...
-- 
-- /**
--  * ===============================
--  * AUTHOR:   Muzammil Hassan (aka Zephyr)
--  * GITHUB:   https://github.com/mmuzammilhassan
--  * ===============================
--  */



-- SO THE "PROFESSIONAL" ORDER:
-- <?php → always first line.
-- Optional but recommended: declare(strict_types=1); (for modern PHP).
-- File-level docblock (author, description, license, etc).
-- Then code (namespace, use, classes, functions).



-- ✅ EXAMPLE OF A PROFESSIONAL ORDER IN AN MVC PROJECT:
-- 
-- <?php
-- declare(strict_types=1);
-- session_start();
-- header('X-Powered-By: Zephyr Framework');
-- 
-- /**
--  * AUTHOR: Muzammil Hassan (aka Zephyr)
--  * DESCRIPTION: Front controller
--  */
-- 
-- require __DIR__ . '/../vendor/autoload.php';
-- 
-- use App\Router;
-- 
-- $router = new Router();
-- $router->dispatch();



-- WELCOME TO PHP’S LITTLE CHAOS. THERE ISN’T ONE SINGLE HEADER FORMAT THAT WORKS FOR EVERY FILE, BECAUSE:
-- Some files need declare(strict_types=1);.
-- Some need session_start();.
-- Some need header() or setcookie().
-- Some need none of these (just pure classes).
-- So if you try to force a universal snippet, it’ll either be overkill (too much boilerplate everywhere) or broken (wrong order in some files).
--
--
-- FOR CLIENT PROJECT/COMMERCIAL USE NOT TO COPY OR RESTRICTED LICENSE
--
-- /**
--  * ========================================
--  * PROJECT:   Client Project Name
--  * AUTHOR:    Muzammil Hassan (aka Zephyr)
--  * CONTACT:   m.muzammil.hassan.dev@gmail.com
--  * CONTACT:   mmuzammilhassan24@gmail.com
--  *
--  * COPYRIGHT © 2025 Muzammil Hassan. All rights reserved.
--  *
--  * This software is proprietary and confidential. Unauthorized
--  * copying, distribution, modification, or use of this software,
--  * in whole or in part, is strictly prohibited without prior
--  * written permission from the author.
--  * ========================================
--  */


--  ❌ DON’T OVERDO ASCII ART EVERYWHERE
-- ASCII blocks at the bottom of every file = bloat + harder diffs.
-- They’re fun, but not common in professional repos. Usually, ASCII art is used once (e.g. in README, dashboard, or main entry file).
-- For regular files, a simple docblock header with author/project/license is enough.
-- Hybrid style you showed (header + footer):
-- ✅ Works technically.
-- ⚠️ But in real projects, it’s overkill to repeat in every single file. Most companies:
-- Put full license in LICENSE file
-- Put author/license header only in main files (entry point, big classes, configs).
-- Leave smaller files clean.
-- 👉 My advice for you:
-- Use the header annotation (your docblock format) at the top of every major file.
-- Use footer ASCII art only in your main entry point or maybe special files (like index.php, README, or dashboard).
-- That way: professional + still stylish.



-- SO YOUR PLAN IS:
-- Header annotation → at the top of main files.
-- Footer ASCII art → only in index, dashboard, or special places.
-- LICENSE file → root of the repo, always.
-- That balance = professional + personal style.

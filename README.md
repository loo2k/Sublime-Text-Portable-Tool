## 介绍

Sublime Text Portable Tool 是一个为 PC 下便携版的 Sublime Text 制作的一个 **增加文件关联以及右键菜单** 的工具，这里提供源代码，如果你可以看懂代码的话，你也可以根据我提供的代码为其他的程序制作一个增加文件关联以及右键菜单的工具。

目前测试为 Sublime Text 2/3 在 Windows 7 32 位系统下运行正常，由于现在用 Winddows 比较少，其他版本的操作系统没有做详细的测试。如果有问题麻烦在 issue 中反馈一下。

## 使用说明

将 `Sublime-Text-Portable-Tool.bat` 和 `ext.txt` 两个文件复制到 Sublime Text 的文件夹中，并确保 Sublime Text 的可执行文件名称为 `sublime_text.exe` ，编辑好 `ext.txt` 后执行 `Sublime-Text-Portable-Tool.bat` 文件即可。 

其中 **ext.txt** 文件中每行代表一个需要绑定的扩展名，如:

    txt
    html
    css
    js
    
如果你想注释该行的话可以使用 `;` 分号对该行进行注释，如：

    ; 这行不会被识别
    ; 因为以 ; 开头的行都会被忽略
    txt
    html
    ;css
    ;js

进行绑定扩展名或者右键菜单打开 `Sublime-Text-Portable-Tool.bat` 按照说明操作即可；

其中 `Sublime-Text-Portable-Tool.exe` 是使用 `Bat_To_Exe_Converter` 生成的；

更多说明可以到我的博客查看 [Sublime Text 2 便携版工具包](http://loo2k.com/blog/sublime-text-2-portable-version-tool/)

## DEMO

运行界面：

![](images/st2tool.png?raw=true)

右键菜单：

![](images/st2menu.png?raw=true)

## License

( The MIT License )

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
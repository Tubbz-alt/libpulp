#source: ibt-plt-3.s
#as: --x32
#ld: -shared -m elf32_x86_64 -z ibtplt --hash-style=sysv
#objdump: -dw

.*: +file format .*


Disassembly of section .plt:

0+1a0 <.plt>:
 +[a-f0-9]+:	ff 35 4a 01 20 00    	pushq  0x20014a\(%rip\)        # 2002f0 <_GLOBAL_OFFSET_TABLE_\+0x8>
 +[a-f0-9]+:	ff 25 4c 01 20 00    	jmpq   \*0x20014c\(%rip\)        # 2002f8 <_GLOBAL_OFFSET_TABLE_\+0x10>
 +[a-f0-9]+:	0f 1f 40 00          	nopl   0x0\(%rax\)
 +[a-f0-9]+:	f3 0f 1e fa          	endbr64 
 +[a-f0-9]+:	68 00 00 00 00       	pushq  \$0x0
 +[a-f0-9]+:	e9 e2 ff ff ff       	jmpq   1a0 <.plt>
 +[a-f0-9]+:	66 90                	xchg   %ax,%ax
 +[a-f0-9]+:	f3 0f 1e fa          	endbr64 
 +[a-f0-9]+:	68 01 00 00 00       	pushq  \$0x1
 +[a-f0-9]+:	e9 d2 ff ff ff       	jmpq   1a0 <.plt>
 +[a-f0-9]+:	66 90                	xchg   %ax,%ax

Disassembly of section .plt.sec:

0+1d0 <bar1@plt>:
 +[a-f0-9]+:	f3 0f 1e fa          	endbr64 
 +[a-f0-9]+:	ff 25 26 01 20 00    	jmpq   \*0x200126\(%rip\)        # 200300 <bar1>
 +[a-f0-9]+:	66 0f 1f 44 00 00    	nopw   0x0\(%rax,%rax,1\)

0+1e0 <bar2@plt>:
 +[a-f0-9]+:	f3 0f 1e fa          	endbr64 
 +[a-f0-9]+:	ff 25 1e 01 20 00    	jmpq   \*0x20011e\(%rip\)        # 200308 <bar2>
 +[a-f0-9]+:	66 0f 1f 44 00 00    	nopw   0x0\(%rax,%rax,1\)

Disassembly of section .text:

0+1f0 <foo>:
 +[a-f0-9]+:	48 83 ec 08          	sub    \$0x8,%rsp
 +[a-f0-9]+:	e8 e7 ff ff ff       	callq  1e0 <bar2@plt>
 +[a-f0-9]+:	48 83 c4 08          	add    \$0x8,%rsp
 +[a-f0-9]+:	e9 ce ff ff ff       	jmpq   1d0 <bar1@plt>
#pass
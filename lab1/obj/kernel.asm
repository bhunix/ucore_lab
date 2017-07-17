
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 18             	sub    $0x18,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 40 fd 10 00       	mov    $0x10fd40,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	83 ec 04             	sub    $0x4,%esp
  100017:	50                   	push   %eax
  100018:	6a 00                	push   $0x0
  10001a:	68 16 ea 10 00       	push   $0x10ea16
  10001f:	e8 ac 2b 00 00       	call   102bd0 <memset>
  100024:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  100027:	e8 fe 14 00 00       	call   10152a <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002c:	c7 45 f4 80 33 10 00 	movl   $0x103380,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100033:	83 ec 08             	sub    $0x8,%esp
  100036:	ff 75 f4             	pushl  -0xc(%ebp)
  100039:	68 9c 33 10 00       	push   $0x10339c
  10003e:	e8 ef 01 00 00       	call   100232 <cprintf>
  100043:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100046:	e8 71 08 00 00       	call   1008bc <print_kerninfo>

    grade_backtrace();
  10004b:	e8 79 00 00 00       	call   1000c9 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100050:	e8 3f 28 00 00       	call   102894 <pmm_init>

    pic_init();                 // init interrupt controller
  100055:	e8 13 16 00 00       	call   10166d <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005a:	e8 74 17 00 00       	call   1017d3 <idt_init>

    clock_init();               // init clock interrupt
  10005f:	e8 ab 0c 00 00       	call   100d0f <clock_init>
    intr_enable();              // enable irq interrupt
  100064:	e8 41 17 00 00       	call   1017aa <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  100069:	e8 4f 01 00 00       	call   1001bd <lab1_switch_test>

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 08             	sub    $0x8,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	83 ec 04             	sub    $0x4,%esp
  100079:	6a 00                	push   $0x0
  10007b:	6a 00                	push   $0x0
  10007d:	6a 00                	push   $0x0
  10007f:	e8 79 0c 00 00       	call   100cfd <mon_backtrace>
  100084:	83 c4 10             	add    $0x10,%esp
}
  100087:	90                   	nop
  100088:	c9                   	leave  
  100089:	c3                   	ret    

0010008a <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10008a:	55                   	push   %ebp
  10008b:	89 e5                	mov    %esp,%ebp
  10008d:	53                   	push   %ebx
  10008e:	83 ec 04             	sub    $0x4,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  100091:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  100094:	8b 55 0c             	mov    0xc(%ebp),%edx
  100097:	8d 5d 08             	lea    0x8(%ebp),%ebx
  10009a:	8b 45 08             	mov    0x8(%ebp),%eax
  10009d:	51                   	push   %ecx
  10009e:	52                   	push   %edx
  10009f:	53                   	push   %ebx
  1000a0:	50                   	push   %eax
  1000a1:	e8 ca ff ff ff       	call   100070 <grade_backtrace2>
  1000a6:	83 c4 10             	add    $0x10,%esp
}
  1000a9:	90                   	nop
  1000aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000ad:	c9                   	leave  
  1000ae:	c3                   	ret    

001000af <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000af:	55                   	push   %ebp
  1000b0:	89 e5                	mov    %esp,%ebp
  1000b2:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace1(arg0, arg2);
  1000b5:	83 ec 08             	sub    $0x8,%esp
  1000b8:	ff 75 10             	pushl  0x10(%ebp)
  1000bb:	ff 75 08             	pushl  0x8(%ebp)
  1000be:	e8 c7 ff ff ff       	call   10008a <grade_backtrace1>
  1000c3:	83 c4 10             	add    $0x10,%esp
}
  1000c6:	90                   	nop
  1000c7:	c9                   	leave  
  1000c8:	c3                   	ret    

001000c9 <grade_backtrace>:

void
grade_backtrace(void) {
  1000c9:	55                   	push   %ebp
  1000ca:	89 e5                	mov    %esp,%ebp
  1000cc:	83 ec 08             	sub    $0x8,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000cf:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000d4:	83 ec 04             	sub    $0x4,%esp
  1000d7:	68 00 00 ff ff       	push   $0xffff0000
  1000dc:	50                   	push   %eax
  1000dd:	6a 00                	push   $0x0
  1000df:	e8 cb ff ff ff       	call   1000af <grade_backtrace0>
  1000e4:	83 c4 10             	add    $0x10,%esp
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  1000ea:	55                   	push   %ebp
  1000eb:	89 e5                	mov    %esp,%ebp
  1000ed:	83 ec 18             	sub    $0x18,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  1000f0:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  1000f3:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  1000f6:	8c 45 f2             	mov    %es,-0xe(%ebp)
  1000f9:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  1000fc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100100:	0f b7 c0             	movzwl %ax,%eax
  100103:	83 e0 03             	and    $0x3,%eax
  100106:	89 c2                	mov    %eax,%edx
  100108:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10010d:	83 ec 04             	sub    $0x4,%esp
  100110:	52                   	push   %edx
  100111:	50                   	push   %eax
  100112:	68 a1 33 10 00       	push   $0x1033a1
  100117:	e8 16 01 00 00       	call   100232 <cprintf>
  10011c:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  10011f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100123:	0f b7 d0             	movzwl %ax,%edx
  100126:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10012b:	83 ec 04             	sub    $0x4,%esp
  10012e:	52                   	push   %edx
  10012f:	50                   	push   %eax
  100130:	68 af 33 10 00       	push   $0x1033af
  100135:	e8 f8 00 00 00       	call   100232 <cprintf>
  10013a:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  10013d:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100141:	0f b7 d0             	movzwl %ax,%edx
  100144:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100149:	83 ec 04             	sub    $0x4,%esp
  10014c:	52                   	push   %edx
  10014d:	50                   	push   %eax
  10014e:	68 bd 33 10 00       	push   $0x1033bd
  100153:	e8 da 00 00 00       	call   100232 <cprintf>
  100158:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  10015b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10015f:	0f b7 d0             	movzwl %ax,%edx
  100162:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100167:	83 ec 04             	sub    $0x4,%esp
  10016a:	52                   	push   %edx
  10016b:	50                   	push   %eax
  10016c:	68 cb 33 10 00       	push   $0x1033cb
  100171:	e8 bc 00 00 00       	call   100232 <cprintf>
  100176:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  100179:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10017d:	0f b7 d0             	movzwl %ax,%edx
  100180:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100185:	83 ec 04             	sub    $0x4,%esp
  100188:	52                   	push   %edx
  100189:	50                   	push   %eax
  10018a:	68 d9 33 10 00       	push   $0x1033d9
  10018f:	e8 9e 00 00 00       	call   100232 <cprintf>
  100194:	83 c4 10             	add    $0x10,%esp
    round ++;
  100197:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10019c:	83 c0 01             	add    $0x1,%eax
  10019f:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001a4:	90                   	nop
  1001a5:	c9                   	leave  
  1001a6:	c3                   	ret    

001001a7 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001a7:	55                   	push   %ebp
  1001a8:	89 e5                	mov    %esp,%ebp
  1001aa:	83 ec 08             	sub    $0x8,%esp
    //asm volatile ("movw %%ax, %%eip" :: "a" (0));
    //asm volatile ("movw %%ax, %%ss" :: "a" (USER_DS));
    //asm volatile ("movw %%ax, %%esp" :: "a" (1000));
    //asm volatile ("movw %%ax, %%cs" :: "a" (USER_CS));
    //asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (USER_CS));
    lab1_print_cur_status();
  1001ad:	e8 38 ff ff ff       	call   1000ea <lab1_print_cur_status>
}
  1001b2:	90                   	nop
  1001b3:	c9                   	leave  
  1001b4:	c3                   	ret    

001001b5 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001b5:	55                   	push   %ebp
  1001b6:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile ("int $120");
  1001b8:	cd 78                	int    $0x78
}
  1001ba:	90                   	nop
  1001bb:	5d                   	pop    %ebp
  1001bc:	c3                   	ret    

001001bd <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001bd:	55                   	push   %ebp
  1001be:	89 e5                	mov    %esp,%ebp
  1001c0:	83 ec 08             	sub    $0x8,%esp
    lab1_print_cur_status();
  1001c3:	e8 22 ff ff ff       	call   1000ea <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001c8:	83 ec 0c             	sub    $0xc,%esp
  1001cb:	68 e8 33 10 00       	push   $0x1033e8
  1001d0:	e8 5d 00 00 00       	call   100232 <cprintf>
  1001d5:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  1001d8:	e8 ca ff ff ff       	call   1001a7 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001dd:	e8 08 ff ff ff       	call   1000ea <lab1_print_cur_status>
#if 0
    cprintf("+++ switch to kernel mode +++\n");
    lab1_switch_to_kernel();
    lab1_print_cur_status();
#endif
}
  1001e2:	90                   	nop
  1001e3:	c9                   	leave  
  1001e4:	c3                   	ret    

001001e5 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1001e5:	55                   	push   %ebp
  1001e6:	89 e5                	mov    %esp,%ebp
  1001e8:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  1001eb:	83 ec 0c             	sub    $0xc,%esp
  1001ee:	ff 75 08             	pushl  0x8(%ebp)
  1001f1:	e8 65 13 00 00       	call   10155b <cons_putc>
  1001f6:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  1001f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001fc:	8b 00                	mov    (%eax),%eax
  1001fe:	8d 50 01             	lea    0x1(%eax),%edx
  100201:	8b 45 0c             	mov    0xc(%ebp),%eax
  100204:	89 10                	mov    %edx,(%eax)
}
  100206:	90                   	nop
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  10020f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100216:	ff 75 0c             	pushl  0xc(%ebp)
  100219:	ff 75 08             	pushl  0x8(%ebp)
  10021c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10021f:	50                   	push   %eax
  100220:	68 e5 01 10 00       	push   $0x1001e5
  100225:	e8 dc 2c 00 00       	call   102f06 <vprintfmt>
  10022a:	83 c4 10             	add    $0x10,%esp
    return cnt;
  10022d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100230:	c9                   	leave  
  100231:	c3                   	ret    

00100232 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100232:	55                   	push   %ebp
  100233:	89 e5                	mov    %esp,%ebp
  100235:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100238:	8d 45 0c             	lea    0xc(%ebp),%eax
  10023b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10023e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100241:	83 ec 08             	sub    $0x8,%esp
  100244:	50                   	push   %eax
  100245:	ff 75 08             	pushl  0x8(%ebp)
  100248:	e8 bc ff ff ff       	call   100209 <vcprintf>
  10024d:	83 c4 10             	add    $0x10,%esp
  100250:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100253:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100256:	c9                   	leave  
  100257:	c3                   	ret    

00100258 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100258:	55                   	push   %ebp
  100259:	89 e5                	mov    %esp,%ebp
  10025b:	83 ec 08             	sub    $0x8,%esp
    cons_putc(c);
  10025e:	83 ec 0c             	sub    $0xc,%esp
  100261:	ff 75 08             	pushl  0x8(%ebp)
  100264:	e8 f2 12 00 00       	call   10155b <cons_putc>
  100269:	83 c4 10             	add    $0x10,%esp
}
  10026c:	90                   	nop
  10026d:	c9                   	leave  
  10026e:	c3                   	ret    

0010026f <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10026f:	55                   	push   %ebp
  100270:	89 e5                	mov    %esp,%ebp
  100272:	83 ec 18             	sub    $0x18,%esp
    int cnt = 0;
  100275:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10027c:	eb 14                	jmp    100292 <cputs+0x23>
        cputch(c, &cnt);
  10027e:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100282:	83 ec 08             	sub    $0x8,%esp
  100285:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100288:	52                   	push   %edx
  100289:	50                   	push   %eax
  10028a:	e8 56 ff ff ff       	call   1001e5 <cputch>
  10028f:	83 c4 10             	add    $0x10,%esp
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  100292:	8b 45 08             	mov    0x8(%ebp),%eax
  100295:	8d 50 01             	lea    0x1(%eax),%edx
  100298:	89 55 08             	mov    %edx,0x8(%ebp)
  10029b:	0f b6 00             	movzbl (%eax),%eax
  10029e:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002a1:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002a5:	75 d7                	jne    10027e <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002a7:	83 ec 08             	sub    $0x8,%esp
  1002aa:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002ad:	50                   	push   %eax
  1002ae:	6a 0a                	push   $0xa
  1002b0:	e8 30 ff ff ff       	call   1001e5 <cputch>
  1002b5:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1002b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002bb:	c9                   	leave  
  1002bc:	c3                   	ret    

001002bd <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002bd:	55                   	push   %ebp
  1002be:	89 e5                	mov    %esp,%ebp
  1002c0:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002c3:	e8 c3 12 00 00       	call   10158b <cons_getc>
  1002c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002cf:	74 f2                	je     1002c3 <getchar+0x6>
        /* do nothing */;
    return c;
  1002d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002d4:	c9                   	leave  
  1002d5:	c3                   	ret    

001002d6 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002d6:	55                   	push   %ebp
  1002d7:	89 e5                	mov    %esp,%ebp
  1002d9:	83 ec 18             	sub    $0x18,%esp
    if (prompt != NULL) {
  1002dc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1002e0:	74 13                	je     1002f5 <readline+0x1f>
        cprintf("%s", prompt);
  1002e2:	83 ec 08             	sub    $0x8,%esp
  1002e5:	ff 75 08             	pushl  0x8(%ebp)
  1002e8:	68 07 34 10 00       	push   $0x103407
  1002ed:	e8 40 ff ff ff       	call   100232 <cprintf>
  1002f2:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  1002f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  1002fc:	e8 bc ff ff ff       	call   1002bd <getchar>
  100301:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100304:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100308:	79 0a                	jns    100314 <readline+0x3e>
            return NULL;
  10030a:	b8 00 00 00 00       	mov    $0x0,%eax
  10030f:	e9 82 00 00 00       	jmp    100396 <readline+0xc0>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100314:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100318:	7e 2b                	jle    100345 <readline+0x6f>
  10031a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100321:	7f 22                	jg     100345 <readline+0x6f>
            cputchar(c);
  100323:	83 ec 0c             	sub    $0xc,%esp
  100326:	ff 75 f0             	pushl  -0x10(%ebp)
  100329:	e8 2a ff ff ff       	call   100258 <cputchar>
  10032e:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100331:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100334:	8d 50 01             	lea    0x1(%eax),%edx
  100337:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10033a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10033d:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100343:	eb 4c                	jmp    100391 <readline+0xbb>
        }
        else if (c == '\b' && i > 0) {
  100345:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100349:	75 1a                	jne    100365 <readline+0x8f>
  10034b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10034f:	7e 14                	jle    100365 <readline+0x8f>
            cputchar(c);
  100351:	83 ec 0c             	sub    $0xc,%esp
  100354:	ff 75 f0             	pushl  -0x10(%ebp)
  100357:	e8 fc fe ff ff       	call   100258 <cputchar>
  10035c:	83 c4 10             	add    $0x10,%esp
            i --;
  10035f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100363:	eb 2c                	jmp    100391 <readline+0xbb>
        }
        else if (c == '\n' || c == '\r') {
  100365:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100369:	74 06                	je     100371 <readline+0x9b>
  10036b:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10036f:	75 8b                	jne    1002fc <readline+0x26>
            cputchar(c);
  100371:	83 ec 0c             	sub    $0xc,%esp
  100374:	ff 75 f0             	pushl  -0x10(%ebp)
  100377:	e8 dc fe ff ff       	call   100258 <cputchar>
  10037c:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  10037f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100382:	05 40 ea 10 00       	add    $0x10ea40,%eax
  100387:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  10038a:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  10038f:	eb 05                	jmp    100396 <readline+0xc0>
        }
    }
  100391:	e9 66 ff ff ff       	jmp    1002fc <readline+0x26>
}
  100396:	c9                   	leave  
  100397:	c3                   	ret    

00100398 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100398:	55                   	push   %ebp
  100399:	89 e5                	mov    %esp,%ebp
  10039b:	83 ec 18             	sub    $0x18,%esp
    if (is_panic) {
  10039e:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003a3:	85 c0                	test   %eax,%eax
  1003a5:	75 4a                	jne    1003f1 <__panic+0x59>
        goto panic_dead;
    }
    is_panic = 1;
  1003a7:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003ae:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003b1:	8d 45 14             	lea    0x14(%ebp),%eax
  1003b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003b7:	83 ec 04             	sub    $0x4,%esp
  1003ba:	ff 75 0c             	pushl  0xc(%ebp)
  1003bd:	ff 75 08             	pushl  0x8(%ebp)
  1003c0:	68 0a 34 10 00       	push   $0x10340a
  1003c5:	e8 68 fe ff ff       	call   100232 <cprintf>
  1003ca:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  1003cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003d0:	83 ec 08             	sub    $0x8,%esp
  1003d3:	50                   	push   %eax
  1003d4:	ff 75 10             	pushl  0x10(%ebp)
  1003d7:	e8 2d fe ff ff       	call   100209 <vcprintf>
  1003dc:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  1003df:	83 ec 0c             	sub    $0xc,%esp
  1003e2:	68 26 34 10 00       	push   $0x103426
  1003e7:	e8 46 fe ff ff       	call   100232 <cprintf>
  1003ec:	83 c4 10             	add    $0x10,%esp
  1003ef:	eb 01                	jmp    1003f2 <__panic+0x5a>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  1003f1:	90                   	nop
    vcprintf(fmt, ap);
    cprintf("\n");
    va_end(ap);

panic_dead:
    intr_disable();
  1003f2:	e8 ba 13 00 00       	call   1017b1 <intr_disable>
    while (1) {
        kmonitor(NULL);
  1003f7:	83 ec 0c             	sub    $0xc,%esp
  1003fa:	6a 00                	push   $0x0
  1003fc:	e8 22 08 00 00       	call   100c23 <kmonitor>
  100401:	83 c4 10             	add    $0x10,%esp
    }
  100404:	eb f1                	jmp    1003f7 <__panic+0x5f>

00100406 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100406:	55                   	push   %ebp
  100407:	89 e5                	mov    %esp,%ebp
  100409:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    va_start(ap, fmt);
  10040c:	8d 45 14             	lea    0x14(%ebp),%eax
  10040f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100412:	83 ec 04             	sub    $0x4,%esp
  100415:	ff 75 0c             	pushl  0xc(%ebp)
  100418:	ff 75 08             	pushl  0x8(%ebp)
  10041b:	68 28 34 10 00       	push   $0x103428
  100420:	e8 0d fe ff ff       	call   100232 <cprintf>
  100425:	83 c4 10             	add    $0x10,%esp
    vcprintf(fmt, ap);
  100428:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10042b:	83 ec 08             	sub    $0x8,%esp
  10042e:	50                   	push   %eax
  10042f:	ff 75 10             	pushl  0x10(%ebp)
  100432:	e8 d2 fd ff ff       	call   100209 <vcprintf>
  100437:	83 c4 10             	add    $0x10,%esp
    cprintf("\n");
  10043a:	83 ec 0c             	sub    $0xc,%esp
  10043d:	68 26 34 10 00       	push   $0x103426
  100442:	e8 eb fd ff ff       	call   100232 <cprintf>
  100447:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  10044a:	90                   	nop
  10044b:	c9                   	leave  
  10044c:	c3                   	ret    

0010044d <is_kernel_panic>:

bool
is_kernel_panic(void) {
  10044d:	55                   	push   %ebp
  10044e:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100450:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100455:	5d                   	pop    %ebp
  100456:	c3                   	ret    

00100457 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100457:	55                   	push   %ebp
  100458:	89 e5                	mov    %esp,%ebp
  10045a:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  10045d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100460:	8b 00                	mov    (%eax),%eax
  100462:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100465:	8b 45 10             	mov    0x10(%ebp),%eax
  100468:	8b 00                	mov    (%eax),%eax
  10046a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10046d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  100474:	e9 d2 00 00 00       	jmp    10054b <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  100479:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10047c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10047f:	01 d0                	add    %edx,%eax
  100481:	89 c2                	mov    %eax,%edx
  100483:	c1 ea 1f             	shr    $0x1f,%edx
  100486:	01 d0                	add    %edx,%eax
  100488:	d1 f8                	sar    %eax
  10048a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10048d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100490:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100493:	eb 04                	jmp    100499 <stab_binsearch+0x42>
            m --;
  100495:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100499:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10049c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10049f:	7c 1f                	jl     1004c0 <stab_binsearch+0x69>
  1004a1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004a4:	89 d0                	mov    %edx,%eax
  1004a6:	01 c0                	add    %eax,%eax
  1004a8:	01 d0                	add    %edx,%eax
  1004aa:	c1 e0 02             	shl    $0x2,%eax
  1004ad:	89 c2                	mov    %eax,%edx
  1004af:	8b 45 08             	mov    0x8(%ebp),%eax
  1004b2:	01 d0                	add    %edx,%eax
  1004b4:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004b8:	0f b6 c0             	movzbl %al,%eax
  1004bb:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004be:	75 d5                	jne    100495 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004c3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004c6:	7d 0b                	jge    1004d3 <stab_binsearch+0x7c>
            l = true_m + 1;
  1004c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004cb:	83 c0 01             	add    $0x1,%eax
  1004ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004d1:	eb 78                	jmp    10054b <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004d3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  1004da:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004dd:	89 d0                	mov    %edx,%eax
  1004df:	01 c0                	add    %eax,%eax
  1004e1:	01 d0                	add    %edx,%eax
  1004e3:	c1 e0 02             	shl    $0x2,%eax
  1004e6:	89 c2                	mov    %eax,%edx
  1004e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1004eb:	01 d0                	add    %edx,%eax
  1004ed:	8b 40 08             	mov    0x8(%eax),%eax
  1004f0:	3b 45 18             	cmp    0x18(%ebp),%eax
  1004f3:	73 13                	jae    100508 <stab_binsearch+0xb1>
            *region_left = m;
  1004f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004f8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004fb:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  1004fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100500:	83 c0 01             	add    $0x1,%eax
  100503:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100506:	eb 43                	jmp    10054b <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100508:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10050b:	89 d0                	mov    %edx,%eax
  10050d:	01 c0                	add    %eax,%eax
  10050f:	01 d0                	add    %edx,%eax
  100511:	c1 e0 02             	shl    $0x2,%eax
  100514:	89 c2                	mov    %eax,%edx
  100516:	8b 45 08             	mov    0x8(%ebp),%eax
  100519:	01 d0                	add    %edx,%eax
  10051b:	8b 40 08             	mov    0x8(%eax),%eax
  10051e:	3b 45 18             	cmp    0x18(%ebp),%eax
  100521:	76 16                	jbe    100539 <stab_binsearch+0xe2>
            *region_right = m - 1;
  100523:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100526:	8d 50 ff             	lea    -0x1(%eax),%edx
  100529:	8b 45 10             	mov    0x10(%ebp),%eax
  10052c:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10052e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100531:	83 e8 01             	sub    $0x1,%eax
  100534:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100537:	eb 12                	jmp    10054b <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100539:	8b 45 0c             	mov    0xc(%ebp),%eax
  10053c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10053f:	89 10                	mov    %edx,(%eax)
            l = m;
  100541:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100544:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100547:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  10054b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10054e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100551:	0f 8e 22 ff ff ff    	jle    100479 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  100557:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10055b:	75 0f                	jne    10056c <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  10055d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100560:	8b 00                	mov    (%eax),%eax
  100562:	8d 50 ff             	lea    -0x1(%eax),%edx
  100565:	8b 45 10             	mov    0x10(%ebp),%eax
  100568:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10056a:	eb 3f                	jmp    1005ab <stab_binsearch+0x154>
    if (!any_matches) {
        *region_right = *region_left - 1;
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  10056c:	8b 45 10             	mov    0x10(%ebp),%eax
  10056f:	8b 00                	mov    (%eax),%eax
  100571:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  100574:	eb 04                	jmp    10057a <stab_binsearch+0x123>
  100576:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  10057a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10057d:	8b 00                	mov    (%eax),%eax
  10057f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100582:	7d 1f                	jge    1005a3 <stab_binsearch+0x14c>
  100584:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100587:	89 d0                	mov    %edx,%eax
  100589:	01 c0                	add    %eax,%eax
  10058b:	01 d0                	add    %edx,%eax
  10058d:	c1 e0 02             	shl    $0x2,%eax
  100590:	89 c2                	mov    %eax,%edx
  100592:	8b 45 08             	mov    0x8(%ebp),%eax
  100595:	01 d0                	add    %edx,%eax
  100597:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10059b:	0f b6 c0             	movzbl %al,%eax
  10059e:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005a1:	75 d3                	jne    100576 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005a6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005a9:	89 10                	mov    %edx,(%eax)
    }
}
  1005ab:	90                   	nop
  1005ac:	c9                   	leave  
  1005ad:	c3                   	ret    

001005ae <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005ae:	55                   	push   %ebp
  1005af:	89 e5                	mov    %esp,%ebp
  1005b1:	83 ec 38             	sub    $0x38,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005b7:	c7 00 48 34 10 00    	movl   $0x103448,(%eax)
    info->eip_line = 0;
  1005bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ca:	c7 40 08 48 34 10 00 	movl   $0x103448,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d4:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005de:	8b 55 08             	mov    0x8(%ebp),%edx
  1005e1:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  1005e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e7:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  1005ee:	c7 45 f4 6c 3c 10 00 	movl   $0x103c6c,-0xc(%ebp)
    stab_end = __STAB_END__;
  1005f5:	c7 45 f0 5c b5 10 00 	movl   $0x10b55c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  1005fc:	c7 45 ec 5d b5 10 00 	movl   $0x10b55d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100603:	c7 45 e8 8a d5 10 00 	movl   $0x10d58a,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10060a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10060d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100610:	76 0d                	jbe    10061f <debuginfo_eip+0x71>
  100612:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100615:	83 e8 01             	sub    $0x1,%eax
  100618:	0f b6 00             	movzbl (%eax),%eax
  10061b:	84 c0                	test   %al,%al
  10061d:	74 0a                	je     100629 <debuginfo_eip+0x7b>
        return -1;
  10061f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100624:	e9 91 02 00 00       	jmp    1008ba <debuginfo_eip+0x30c>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100629:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100630:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100633:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100636:	29 c2                	sub    %eax,%edx
  100638:	89 d0                	mov    %edx,%eax
  10063a:	c1 f8 02             	sar    $0x2,%eax
  10063d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100643:	83 e8 01             	sub    $0x1,%eax
  100646:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100649:	ff 75 08             	pushl  0x8(%ebp)
  10064c:	6a 64                	push   $0x64
  10064e:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100651:	50                   	push   %eax
  100652:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100655:	50                   	push   %eax
  100656:	ff 75 f4             	pushl  -0xc(%ebp)
  100659:	e8 f9 fd ff ff       	call   100457 <stab_binsearch>
  10065e:	83 c4 14             	add    $0x14,%esp
    if (lfile == 0)
  100661:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100664:	85 c0                	test   %eax,%eax
  100666:	75 0a                	jne    100672 <debuginfo_eip+0xc4>
        return -1;
  100668:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10066d:	e9 48 02 00 00       	jmp    1008ba <debuginfo_eip+0x30c>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  100672:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100675:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100678:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10067b:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  10067e:	ff 75 08             	pushl  0x8(%ebp)
  100681:	6a 24                	push   $0x24
  100683:	8d 45 d8             	lea    -0x28(%ebp),%eax
  100686:	50                   	push   %eax
  100687:	8d 45 dc             	lea    -0x24(%ebp),%eax
  10068a:	50                   	push   %eax
  10068b:	ff 75 f4             	pushl  -0xc(%ebp)
  10068e:	e8 c4 fd ff ff       	call   100457 <stab_binsearch>
  100693:	83 c4 14             	add    $0x14,%esp

    if (lfun <= rfun) {
  100696:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100699:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10069c:	39 c2                	cmp    %eax,%edx
  10069e:	7f 7c                	jg     10071c <debuginfo_eip+0x16e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006a3:	89 c2                	mov    %eax,%edx
  1006a5:	89 d0                	mov    %edx,%eax
  1006a7:	01 c0                	add    %eax,%eax
  1006a9:	01 d0                	add    %edx,%eax
  1006ab:	c1 e0 02             	shl    $0x2,%eax
  1006ae:	89 c2                	mov    %eax,%edx
  1006b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006b3:	01 d0                	add    %edx,%eax
  1006b5:	8b 00                	mov    (%eax),%eax
  1006b7:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1006ba:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006bd:	29 d1                	sub    %edx,%ecx
  1006bf:	89 ca                	mov    %ecx,%edx
  1006c1:	39 d0                	cmp    %edx,%eax
  1006c3:	73 22                	jae    1006e7 <debuginfo_eip+0x139>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006c8:	89 c2                	mov    %eax,%edx
  1006ca:	89 d0                	mov    %edx,%eax
  1006cc:	01 c0                	add    %eax,%eax
  1006ce:	01 d0                	add    %edx,%eax
  1006d0:	c1 e0 02             	shl    $0x2,%eax
  1006d3:	89 c2                	mov    %eax,%edx
  1006d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d8:	01 d0                	add    %edx,%eax
  1006da:	8b 10                	mov    (%eax),%edx
  1006dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1006df:	01 c2                	add    %eax,%edx
  1006e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006e4:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  1006e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006ea:	89 c2                	mov    %eax,%edx
  1006ec:	89 d0                	mov    %edx,%eax
  1006ee:	01 c0                	add    %eax,%eax
  1006f0:	01 d0                	add    %edx,%eax
  1006f2:	c1 e0 02             	shl    $0x2,%eax
  1006f5:	89 c2                	mov    %eax,%edx
  1006f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006fa:	01 d0                	add    %edx,%eax
  1006fc:	8b 50 08             	mov    0x8(%eax),%edx
  1006ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100702:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100705:	8b 45 0c             	mov    0xc(%ebp),%eax
  100708:	8b 40 10             	mov    0x10(%eax),%eax
  10070b:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10070e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100711:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100714:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100717:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10071a:	eb 15                	jmp    100731 <debuginfo_eip+0x183>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10071c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10071f:	8b 55 08             	mov    0x8(%ebp),%edx
  100722:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100725:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100728:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  10072b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10072e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100731:	8b 45 0c             	mov    0xc(%ebp),%eax
  100734:	8b 40 08             	mov    0x8(%eax),%eax
  100737:	83 ec 08             	sub    $0x8,%esp
  10073a:	6a 3a                	push   $0x3a
  10073c:	50                   	push   %eax
  10073d:	e8 02 23 00 00       	call   102a44 <strfind>
  100742:	83 c4 10             	add    $0x10,%esp
  100745:	89 c2                	mov    %eax,%edx
  100747:	8b 45 0c             	mov    0xc(%ebp),%eax
  10074a:	8b 40 08             	mov    0x8(%eax),%eax
  10074d:	29 c2                	sub    %eax,%edx
  10074f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100752:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  100755:	83 ec 0c             	sub    $0xc,%esp
  100758:	ff 75 08             	pushl  0x8(%ebp)
  10075b:	6a 44                	push   $0x44
  10075d:	8d 45 d0             	lea    -0x30(%ebp),%eax
  100760:	50                   	push   %eax
  100761:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  100764:	50                   	push   %eax
  100765:	ff 75 f4             	pushl  -0xc(%ebp)
  100768:	e8 ea fc ff ff       	call   100457 <stab_binsearch>
  10076d:	83 c4 20             	add    $0x20,%esp
    if (lline <= rline) {
  100770:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100773:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100776:	39 c2                	cmp    %eax,%edx
  100778:	7f 24                	jg     10079e <debuginfo_eip+0x1f0>
        info->eip_line = stabs[rline].n_desc;
  10077a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10077d:	89 c2                	mov    %eax,%edx
  10077f:	89 d0                	mov    %edx,%eax
  100781:	01 c0                	add    %eax,%eax
  100783:	01 d0                	add    %edx,%eax
  100785:	c1 e0 02             	shl    $0x2,%eax
  100788:	89 c2                	mov    %eax,%edx
  10078a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10078d:	01 d0                	add    %edx,%eax
  10078f:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100793:	0f b7 d0             	movzwl %ax,%edx
  100796:	8b 45 0c             	mov    0xc(%ebp),%eax
  100799:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10079c:	eb 13                	jmp    1007b1 <debuginfo_eip+0x203>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  10079e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007a3:	e9 12 01 00 00       	jmp    1008ba <debuginfo_eip+0x30c>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007ab:	83 e8 01             	sub    $0x1,%eax
  1007ae:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007b1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007b7:	39 c2                	cmp    %eax,%edx
  1007b9:	7c 56                	jl     100811 <debuginfo_eip+0x263>
           && stabs[lline].n_type != N_SOL
  1007bb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007be:	89 c2                	mov    %eax,%edx
  1007c0:	89 d0                	mov    %edx,%eax
  1007c2:	01 c0                	add    %eax,%eax
  1007c4:	01 d0                	add    %edx,%eax
  1007c6:	c1 e0 02             	shl    $0x2,%eax
  1007c9:	89 c2                	mov    %eax,%edx
  1007cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007ce:	01 d0                	add    %edx,%eax
  1007d0:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007d4:	3c 84                	cmp    $0x84,%al
  1007d6:	74 39                	je     100811 <debuginfo_eip+0x263>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  1007d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007db:	89 c2                	mov    %eax,%edx
  1007dd:	89 d0                	mov    %edx,%eax
  1007df:	01 c0                	add    %eax,%eax
  1007e1:	01 d0                	add    %edx,%eax
  1007e3:	c1 e0 02             	shl    $0x2,%eax
  1007e6:	89 c2                	mov    %eax,%edx
  1007e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007eb:	01 d0                	add    %edx,%eax
  1007ed:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1007f1:	3c 64                	cmp    $0x64,%al
  1007f3:	75 b3                	jne    1007a8 <debuginfo_eip+0x1fa>
  1007f5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007f8:	89 c2                	mov    %eax,%edx
  1007fa:	89 d0                	mov    %edx,%eax
  1007fc:	01 c0                	add    %eax,%eax
  1007fe:	01 d0                	add    %edx,%eax
  100800:	c1 e0 02             	shl    $0x2,%eax
  100803:	89 c2                	mov    %eax,%edx
  100805:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100808:	01 d0                	add    %edx,%eax
  10080a:	8b 40 08             	mov    0x8(%eax),%eax
  10080d:	85 c0                	test   %eax,%eax
  10080f:	74 97                	je     1007a8 <debuginfo_eip+0x1fa>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100811:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100814:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100817:	39 c2                	cmp    %eax,%edx
  100819:	7c 46                	jl     100861 <debuginfo_eip+0x2b3>
  10081b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10081e:	89 c2                	mov    %eax,%edx
  100820:	89 d0                	mov    %edx,%eax
  100822:	01 c0                	add    %eax,%eax
  100824:	01 d0                	add    %edx,%eax
  100826:	c1 e0 02             	shl    $0x2,%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10082e:	01 d0                	add    %edx,%eax
  100830:	8b 00                	mov    (%eax),%eax
  100832:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100835:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100838:	29 d1                	sub    %edx,%ecx
  10083a:	89 ca                	mov    %ecx,%edx
  10083c:	39 d0                	cmp    %edx,%eax
  10083e:	73 21                	jae    100861 <debuginfo_eip+0x2b3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  100840:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100843:	89 c2                	mov    %eax,%edx
  100845:	89 d0                	mov    %edx,%eax
  100847:	01 c0                	add    %eax,%eax
  100849:	01 d0                	add    %edx,%eax
  10084b:	c1 e0 02             	shl    $0x2,%eax
  10084e:	89 c2                	mov    %eax,%edx
  100850:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100853:	01 d0                	add    %edx,%eax
  100855:	8b 10                	mov    (%eax),%edx
  100857:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10085a:	01 c2                	add    %eax,%edx
  10085c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10085f:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  100861:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100864:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100867:	39 c2                	cmp    %eax,%edx
  100869:	7d 4a                	jge    1008b5 <debuginfo_eip+0x307>
        for (lline = lfun + 1;
  10086b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10086e:	83 c0 01             	add    $0x1,%eax
  100871:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100874:	eb 18                	jmp    10088e <debuginfo_eip+0x2e0>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100876:	8b 45 0c             	mov    0xc(%ebp),%eax
  100879:	8b 40 14             	mov    0x14(%eax),%eax
  10087c:	8d 50 01             	lea    0x1(%eax),%edx
  10087f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100882:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  100885:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100888:	83 c0 01             	add    $0x1,%eax
  10088b:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  10088e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100891:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  100894:	39 c2                	cmp    %eax,%edx
  100896:	7d 1d                	jge    1008b5 <debuginfo_eip+0x307>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100898:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10089b:	89 c2                	mov    %eax,%edx
  10089d:	89 d0                	mov    %edx,%eax
  10089f:	01 c0                	add    %eax,%eax
  1008a1:	01 d0                	add    %edx,%eax
  1008a3:	c1 e0 02             	shl    $0x2,%eax
  1008a6:	89 c2                	mov    %eax,%edx
  1008a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008ab:	01 d0                	add    %edx,%eax
  1008ad:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008b1:	3c a0                	cmp    $0xa0,%al
  1008b3:	74 c1                	je     100876 <debuginfo_eip+0x2c8>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  1008b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008ba:	c9                   	leave  
  1008bb:	c3                   	ret    

001008bc <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008bc:	55                   	push   %ebp
  1008bd:	89 e5                	mov    %esp,%ebp
  1008bf:	83 ec 08             	sub    $0x8,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008c2:	83 ec 0c             	sub    $0xc,%esp
  1008c5:	68 52 34 10 00       	push   $0x103452
  1008ca:	e8 63 f9 ff ff       	call   100232 <cprintf>
  1008cf:	83 c4 10             	add    $0x10,%esp
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  1008d2:	83 ec 08             	sub    $0x8,%esp
  1008d5:	68 00 00 10 00       	push   $0x100000
  1008da:	68 6b 34 10 00       	push   $0x10346b
  1008df:	e8 4e f9 ff ff       	call   100232 <cprintf>
  1008e4:	83 c4 10             	add    $0x10,%esp
    cprintf("  etext  0x%08x (phys)\n", etext);
  1008e7:	83 ec 08             	sub    $0x8,%esp
  1008ea:	68 67 33 10 00       	push   $0x103367
  1008ef:	68 83 34 10 00       	push   $0x103483
  1008f4:	e8 39 f9 ff ff       	call   100232 <cprintf>
  1008f9:	83 c4 10             	add    $0x10,%esp
    cprintf("  edata  0x%08x (phys)\n", edata);
  1008fc:	83 ec 08             	sub    $0x8,%esp
  1008ff:	68 16 ea 10 00       	push   $0x10ea16
  100904:	68 9b 34 10 00       	push   $0x10349b
  100909:	e8 24 f9 ff ff       	call   100232 <cprintf>
  10090e:	83 c4 10             	add    $0x10,%esp
    cprintf("  end    0x%08x (phys)\n", end);
  100911:	83 ec 08             	sub    $0x8,%esp
  100914:	68 40 fd 10 00       	push   $0x10fd40
  100919:	68 b3 34 10 00       	push   $0x1034b3
  10091e:	e8 0f f9 ff ff       	call   100232 <cprintf>
  100923:	83 c4 10             	add    $0x10,%esp
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100926:	b8 40 fd 10 00       	mov    $0x10fd40,%eax
  10092b:	05 ff 03 00 00       	add    $0x3ff,%eax
  100930:	ba 00 00 10 00       	mov    $0x100000,%edx
  100935:	29 d0                	sub    %edx,%eax
  100937:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10093d:	85 c0                	test   %eax,%eax
  10093f:	0f 48 c2             	cmovs  %edx,%eax
  100942:	c1 f8 0a             	sar    $0xa,%eax
  100945:	83 ec 08             	sub    $0x8,%esp
  100948:	50                   	push   %eax
  100949:	68 cc 34 10 00       	push   $0x1034cc
  10094e:	e8 df f8 ff ff       	call   100232 <cprintf>
  100953:	83 c4 10             	add    $0x10,%esp
}
  100956:	90                   	nop
  100957:	c9                   	leave  
  100958:	c3                   	ret    

00100959 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100959:	55                   	push   %ebp
  10095a:	89 e5                	mov    %esp,%ebp
  10095c:	81 ec 28 01 00 00    	sub    $0x128,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  100962:	83 ec 08             	sub    $0x8,%esp
  100965:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100968:	50                   	push   %eax
  100969:	ff 75 08             	pushl  0x8(%ebp)
  10096c:	e8 3d fc ff ff       	call   1005ae <debuginfo_eip>
  100971:	83 c4 10             	add    $0x10,%esp
  100974:	85 c0                	test   %eax,%eax
  100976:	74 15                	je     10098d <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100978:	83 ec 08             	sub    $0x8,%esp
  10097b:	ff 75 08             	pushl  0x8(%ebp)
  10097e:	68 f6 34 10 00       	push   $0x1034f6
  100983:	e8 aa f8 ff ff       	call   100232 <cprintf>
  100988:	83 c4 10             	add    $0x10,%esp
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  10098b:	eb 65                	jmp    1009f2 <print_debuginfo+0x99>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  10098d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100994:	eb 1c                	jmp    1009b2 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100996:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100999:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10099c:	01 d0                	add    %edx,%eax
  10099e:	0f b6 00             	movzbl (%eax),%eax
  1009a1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009aa:	01 ca                	add    %ecx,%edx
  1009ac:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1009b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009b5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  1009b8:	7f dc                	jg     100996 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  1009ba:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009c3:	01 d0                	add    %edx,%eax
  1009c5:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  1009c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009cb:	8b 55 08             	mov    0x8(%ebp),%edx
  1009ce:	89 d1                	mov    %edx,%ecx
  1009d0:	29 c1                	sub    %eax,%ecx
  1009d2:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1009d5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009d8:	83 ec 0c             	sub    $0xc,%esp
  1009db:	51                   	push   %ecx
  1009dc:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009e2:	51                   	push   %ecx
  1009e3:	52                   	push   %edx
  1009e4:	50                   	push   %eax
  1009e5:	68 12 35 10 00       	push   $0x103512
  1009ea:	e8 43 f8 ff ff       	call   100232 <cprintf>
  1009ef:	83 c4 20             	add    $0x20,%esp
                fnname, eip - info.eip_fn_addr);
    }
}
  1009f2:	90                   	nop
  1009f3:	c9                   	leave  
  1009f4:	c3                   	ret    

001009f5 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  1009f5:	55                   	push   %ebp
  1009f6:	89 e5                	mov    %esp,%ebp
  1009f8:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  1009fb:	8b 45 04             	mov    0x4(%ebp),%eax
  1009fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a01:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a04:	c9                   	leave  
  100a05:	c3                   	ret    

00100a06 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a06:	55                   	push   %ebp
  100a07:	89 e5                	mov    %esp,%ebp
  100a09:	83 ec 18             	sub    $0x18,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a0c:	89 e8                	mov    %ebp,%eax
  100a0e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    return ebp;
  100a11:	8b 45 e8             	mov    -0x18(%ebp),%eax
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    int i;
    uint32_t ebp, eip;
    ebp = read_ebp();
  100a14:	89 45 f0             	mov    %eax,-0x10(%ebp)
    eip = read_eip();
  100a17:	e8 d9 ff ff ff       	call   1009f5 <read_eip>
  100a1c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    while (ebp != 0)
  100a1f:	e9 86 00 00 00       	jmp    100aaa <print_stackframe+0xa4>
    {
    cprintf("ebp:0x%08x eip:0x%08x ", ebp, eip);
  100a24:	83 ec 04             	sub    $0x4,%esp
  100a27:	ff 75 ec             	pushl  -0x14(%ebp)
  100a2a:	ff 75 f0             	pushl  -0x10(%ebp)
  100a2d:	68 24 35 10 00       	push   $0x103524
  100a32:	e8 fb f7 ff ff       	call   100232 <cprintf>
  100a37:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < 4; i++)
  100a3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a41:	eb 2c                	jmp    100a6f <print_stackframe+0x69>
    {
        cprintf ("arg%d:0x%08x ", i, ((uint32_t *)ebp+2)[i]);
  100a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a46:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a50:	01 d0                	add    %edx,%eax
  100a52:	83 c0 08             	add    $0x8,%eax
  100a55:	8b 00                	mov    (%eax),%eax
  100a57:	83 ec 04             	sub    $0x4,%esp
  100a5a:	50                   	push   %eax
  100a5b:	ff 75 f4             	pushl  -0xc(%ebp)
  100a5e:	68 3b 35 10 00       	push   $0x10353b
  100a63:	e8 ca f7 ff ff       	call   100232 <cprintf>
  100a68:	83 c4 10             	add    $0x10,%esp
    ebp = read_ebp();
    eip = read_eip();
    while (ebp != 0)
    {
    cprintf("ebp:0x%08x eip:0x%08x ", ebp, eip);
    for (i = 0; i < 4; i++)
  100a6b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100a6f:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  100a73:	7e ce                	jle    100a43 <print_stackframe+0x3d>
    {
        cprintf ("arg%d:0x%08x ", i, ((uint32_t *)ebp+2)[i]);
    }
    cprintf("\n");
  100a75:	83 ec 0c             	sub    $0xc,%esp
  100a78:	68 49 35 10 00       	push   $0x103549
  100a7d:	e8 b0 f7 ff ff       	call   100232 <cprintf>
  100a82:	83 c4 10             	add    $0x10,%esp
    print_debuginfo (eip-1);
  100a85:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a88:	83 e8 01             	sub    $0x1,%eax
  100a8b:	83 ec 0c             	sub    $0xc,%esp
  100a8e:	50                   	push   %eax
  100a8f:	e8 c5 fe ff ff       	call   100959 <print_debuginfo>
  100a94:	83 c4 10             	add    $0x10,%esp
    ebp = *((uint32_t *)ebp);
  100a97:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a9a:	8b 00                	mov    (%eax),%eax
  100a9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    eip = *((uint32_t *)ebp+1);
  100a9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100aa2:	83 c0 04             	add    $0x4,%eax
  100aa5:	8b 00                	mov    (%eax),%eax
  100aa7:	89 45 ec             	mov    %eax,-0x14(%ebp)
      */
    int i;
    uint32_t ebp, eip;
    ebp = read_ebp();
    eip = read_eip();
    while (ebp != 0)
  100aaa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100aae:	0f 85 70 ff ff ff    	jne    100a24 <print_stackframe+0x1e>
    cprintf("\n");
    print_debuginfo (eip-1);
    ebp = *((uint32_t *)ebp);
    eip = *((uint32_t *)ebp+1);
    }
}
  100ab4:	90                   	nop
  100ab5:	c9                   	leave  
  100ab6:	c3                   	ret    

00100ab7 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100ab7:	55                   	push   %ebp
  100ab8:	89 e5                	mov    %esp,%ebp
  100aba:	83 ec 18             	sub    $0x18,%esp
    int argc = 0;
  100abd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ac4:	eb 0c                	jmp    100ad2 <parse+0x1b>
            *buf ++ = '\0';
  100ac6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ac9:	8d 50 01             	lea    0x1(%eax),%edx
  100acc:	89 55 08             	mov    %edx,0x8(%ebp)
  100acf:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100ad2:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad5:	0f b6 00             	movzbl (%eax),%eax
  100ad8:	84 c0                	test   %al,%al
  100ada:	74 1e                	je     100afa <parse+0x43>
  100adc:	8b 45 08             	mov    0x8(%ebp),%eax
  100adf:	0f b6 00             	movzbl (%eax),%eax
  100ae2:	0f be c0             	movsbl %al,%eax
  100ae5:	83 ec 08             	sub    $0x8,%esp
  100ae8:	50                   	push   %eax
  100ae9:	68 cc 35 10 00       	push   $0x1035cc
  100aee:	e8 1e 1f 00 00       	call   102a11 <strchr>
  100af3:	83 c4 10             	add    $0x10,%esp
  100af6:	85 c0                	test   %eax,%eax
  100af8:	75 cc                	jne    100ac6 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100afa:	8b 45 08             	mov    0x8(%ebp),%eax
  100afd:	0f b6 00             	movzbl (%eax),%eax
  100b00:	84 c0                	test   %al,%al
  100b02:	74 69                	je     100b6d <parse+0xb6>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b04:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b08:	75 12                	jne    100b1c <parse+0x65>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b0a:	83 ec 08             	sub    $0x8,%esp
  100b0d:	6a 10                	push   $0x10
  100b0f:	68 d1 35 10 00       	push   $0x1035d1
  100b14:	e8 19 f7 ff ff       	call   100232 <cprintf>
  100b19:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b1f:	8d 50 01             	lea    0x1(%eax),%edx
  100b22:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b25:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b2c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b2f:	01 c2                	add    %eax,%edx
  100b31:	8b 45 08             	mov    0x8(%ebp),%eax
  100b34:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b36:	eb 04                	jmp    100b3c <parse+0x85>
            buf ++;
  100b38:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b3c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b3f:	0f b6 00             	movzbl (%eax),%eax
  100b42:	84 c0                	test   %al,%al
  100b44:	0f 84 7a ff ff ff    	je     100ac4 <parse+0xd>
  100b4a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b4d:	0f b6 00             	movzbl (%eax),%eax
  100b50:	0f be c0             	movsbl %al,%eax
  100b53:	83 ec 08             	sub    $0x8,%esp
  100b56:	50                   	push   %eax
  100b57:	68 cc 35 10 00       	push   $0x1035cc
  100b5c:	e8 b0 1e 00 00       	call   102a11 <strchr>
  100b61:	83 c4 10             	add    $0x10,%esp
  100b64:	85 c0                	test   %eax,%eax
  100b66:	74 d0                	je     100b38 <parse+0x81>
            buf ++;
        }
    }
  100b68:	e9 57 ff ff ff       	jmp    100ac4 <parse+0xd>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100b6d:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b71:	c9                   	leave  
  100b72:	c3                   	ret    

00100b73 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b73:	55                   	push   %ebp
  100b74:	89 e5                	mov    %esp,%ebp
  100b76:	83 ec 58             	sub    $0x58,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b79:	83 ec 08             	sub    $0x8,%esp
  100b7c:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b7f:	50                   	push   %eax
  100b80:	ff 75 08             	pushl  0x8(%ebp)
  100b83:	e8 2f ff ff ff       	call   100ab7 <parse>
  100b88:	83 c4 10             	add    $0x10,%esp
  100b8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b8e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b92:	75 0a                	jne    100b9e <runcmd+0x2b>
        return 0;
  100b94:	b8 00 00 00 00       	mov    $0x0,%eax
  100b99:	e9 83 00 00 00       	jmp    100c21 <runcmd+0xae>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b9e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100ba5:	eb 59                	jmp    100c00 <runcmd+0x8d>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100ba7:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100baa:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bad:	89 d0                	mov    %edx,%eax
  100baf:	01 c0                	add    %eax,%eax
  100bb1:	01 d0                	add    %edx,%eax
  100bb3:	c1 e0 02             	shl    $0x2,%eax
  100bb6:	05 00 e0 10 00       	add    $0x10e000,%eax
  100bbb:	8b 00                	mov    (%eax),%eax
  100bbd:	83 ec 08             	sub    $0x8,%esp
  100bc0:	51                   	push   %ecx
  100bc1:	50                   	push   %eax
  100bc2:	e8 aa 1d 00 00       	call   102971 <strcmp>
  100bc7:	83 c4 10             	add    $0x10,%esp
  100bca:	85 c0                	test   %eax,%eax
  100bcc:	75 2e                	jne    100bfc <runcmd+0x89>
            return commands[i].func(argc - 1, argv + 1, tf);
  100bce:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bd1:	89 d0                	mov    %edx,%eax
  100bd3:	01 c0                	add    %eax,%eax
  100bd5:	01 d0                	add    %edx,%eax
  100bd7:	c1 e0 02             	shl    $0x2,%eax
  100bda:	05 08 e0 10 00       	add    $0x10e008,%eax
  100bdf:	8b 10                	mov    (%eax),%edx
  100be1:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100be4:	83 c0 04             	add    $0x4,%eax
  100be7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100bea:	83 e9 01             	sub    $0x1,%ecx
  100bed:	83 ec 04             	sub    $0x4,%esp
  100bf0:	ff 75 0c             	pushl  0xc(%ebp)
  100bf3:	50                   	push   %eax
  100bf4:	51                   	push   %ecx
  100bf5:	ff d2                	call   *%edx
  100bf7:	83 c4 10             	add    $0x10,%esp
  100bfa:	eb 25                	jmp    100c21 <runcmd+0xae>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bfc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c00:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c03:	83 f8 02             	cmp    $0x2,%eax
  100c06:	76 9f                	jbe    100ba7 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c08:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c0b:	83 ec 08             	sub    $0x8,%esp
  100c0e:	50                   	push   %eax
  100c0f:	68 ef 35 10 00       	push   $0x1035ef
  100c14:	e8 19 f6 ff ff       	call   100232 <cprintf>
  100c19:	83 c4 10             	add    $0x10,%esp
    return 0;
  100c1c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c21:	c9                   	leave  
  100c22:	c3                   	ret    

00100c23 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c23:	55                   	push   %ebp
  100c24:	89 e5                	mov    %esp,%ebp
  100c26:	83 ec 18             	sub    $0x18,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c29:	83 ec 0c             	sub    $0xc,%esp
  100c2c:	68 08 36 10 00       	push   $0x103608
  100c31:	e8 fc f5 ff ff       	call   100232 <cprintf>
  100c36:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100c39:	83 ec 0c             	sub    $0xc,%esp
  100c3c:	68 30 36 10 00       	push   $0x103630
  100c41:	e8 ec f5 ff ff       	call   100232 <cprintf>
  100c46:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100c49:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c4d:	74 0e                	je     100c5d <kmonitor+0x3a>
        print_trapframe(tf);
  100c4f:	83 ec 0c             	sub    $0xc,%esp
  100c52:	ff 75 08             	pushl  0x8(%ebp)
  100c55:	e8 b3 0c 00 00       	call   10190d <print_trapframe>
  100c5a:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100c5d:	83 ec 0c             	sub    $0xc,%esp
  100c60:	68 55 36 10 00       	push   $0x103655
  100c65:	e8 6c f6 ff ff       	call   1002d6 <readline>
  100c6a:	83 c4 10             	add    $0x10,%esp
  100c6d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c70:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c74:	74 e7                	je     100c5d <kmonitor+0x3a>
            if (runcmd(buf, tf) < 0) {
  100c76:	83 ec 08             	sub    $0x8,%esp
  100c79:	ff 75 08             	pushl  0x8(%ebp)
  100c7c:	ff 75 f4             	pushl  -0xc(%ebp)
  100c7f:	e8 ef fe ff ff       	call   100b73 <runcmd>
  100c84:	83 c4 10             	add    $0x10,%esp
  100c87:	85 c0                	test   %eax,%eax
  100c89:	78 02                	js     100c8d <kmonitor+0x6a>
                break;
            }
        }
    }
  100c8b:	eb d0                	jmp    100c5d <kmonitor+0x3a>

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
  100c8d:	90                   	nop
            }
        }
    }
}
  100c8e:	90                   	nop
  100c8f:	c9                   	leave  
  100c90:	c3                   	ret    

00100c91 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c91:	55                   	push   %ebp
  100c92:	89 e5                	mov    %esp,%ebp
  100c94:	83 ec 18             	sub    $0x18,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c97:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c9e:	eb 3c                	jmp    100cdc <mon_help+0x4b>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100ca0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ca3:	89 d0                	mov    %edx,%eax
  100ca5:	01 c0                	add    %eax,%eax
  100ca7:	01 d0                	add    %edx,%eax
  100ca9:	c1 e0 02             	shl    $0x2,%eax
  100cac:	05 04 e0 10 00       	add    $0x10e004,%eax
  100cb1:	8b 08                	mov    (%eax),%ecx
  100cb3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cb6:	89 d0                	mov    %edx,%eax
  100cb8:	01 c0                	add    %eax,%eax
  100cba:	01 d0                	add    %edx,%eax
  100cbc:	c1 e0 02             	shl    $0x2,%eax
  100cbf:	05 00 e0 10 00       	add    $0x10e000,%eax
  100cc4:	8b 00                	mov    (%eax),%eax
  100cc6:	83 ec 04             	sub    $0x4,%esp
  100cc9:	51                   	push   %ecx
  100cca:	50                   	push   %eax
  100ccb:	68 59 36 10 00       	push   $0x103659
  100cd0:	e8 5d f5 ff ff       	call   100232 <cprintf>
  100cd5:	83 c4 10             	add    $0x10,%esp

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cd8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100cdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cdf:	83 f8 02             	cmp    $0x2,%eax
  100ce2:	76 bc                	jbe    100ca0 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100ce4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ce9:	c9                   	leave  
  100cea:	c3                   	ret    

00100ceb <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100ceb:	55                   	push   %ebp
  100cec:	89 e5                	mov    %esp,%ebp
  100cee:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100cf1:	e8 c6 fb ff ff       	call   1008bc <print_kerninfo>
    return 0;
  100cf6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cfb:	c9                   	leave  
  100cfc:	c3                   	ret    

00100cfd <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100cfd:	55                   	push   %ebp
  100cfe:	89 e5                	mov    %esp,%ebp
  100d00:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d03:	e8 fe fc ff ff       	call   100a06 <print_stackframe>
    return 0;
  100d08:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d0d:	c9                   	leave  
  100d0e:	c3                   	ret    

00100d0f <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d0f:	55                   	push   %ebp
  100d10:	89 e5                	mov    %esp,%ebp
  100d12:	83 ec 18             	sub    $0x18,%esp
  100d15:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d1b:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d1f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100d23:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d27:	ee                   	out    %al,(%dx)
  100d28:	66 c7 45 f4 40 00    	movw   $0x40,-0xc(%ebp)
  100d2e:	c6 45 f0 9c          	movb   $0x9c,-0x10(%ebp)
  100d32:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100d36:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100d3a:	ee                   	out    %al,(%dx)
  100d3b:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d41:	c6 45 f1 2e          	movb   $0x2e,-0xf(%ebp)
  100d45:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d49:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d4d:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d4e:	c7 05 28 f9 10 00 00 	movl   $0x0,0x10f928
  100d55:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d58:	83 ec 0c             	sub    $0xc,%esp
  100d5b:	68 62 36 10 00       	push   $0x103662
  100d60:	e8 cd f4 ff ff       	call   100232 <cprintf>
  100d65:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100d68:	83 ec 0c             	sub    $0xc,%esp
  100d6b:	6a 00                	push   $0x0
  100d6d:	e8 ce 08 00 00       	call   101640 <pic_enable>
  100d72:	83 c4 10             	add    $0x10,%esp
}
  100d75:	90                   	nop
  100d76:	c9                   	leave  
  100d77:	c3                   	ret    

00100d78 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d78:	55                   	push   %ebp
  100d79:	89 e5                	mov    %esp,%ebp
  100d7b:	83 ec 10             	sub    $0x10,%esp
  100d7e:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100d84:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100d88:	89 c2                	mov    %eax,%edx
  100d8a:	ec                   	in     (%dx),%al
  100d8b:	88 45 f4             	mov    %al,-0xc(%ebp)
  100d8e:	66 c7 45 fc 84 00    	movw   $0x84,-0x4(%ebp)
  100d94:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  100d98:	89 c2                	mov    %eax,%edx
  100d9a:	ec                   	in     (%dx),%al
  100d9b:	88 45 f5             	mov    %al,-0xb(%ebp)
  100d9e:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100da4:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100da8:	89 c2                	mov    %eax,%edx
  100daa:	ec                   	in     (%dx),%al
  100dab:	88 45 f6             	mov    %al,-0xa(%ebp)
  100dae:	66 c7 45 f8 84 00    	movw   $0x84,-0x8(%ebp)
  100db4:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  100db8:	89 c2                	mov    %eax,%edx
  100dba:	ec                   	in     (%dx),%al
  100dbb:	88 45 f7             	mov    %al,-0x9(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dbe:	90                   	nop
  100dbf:	c9                   	leave  
  100dc0:	c3                   	ret    

00100dc1 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100dc1:	55                   	push   %ebp
  100dc2:	89 e5                	mov    %esp,%ebp
  100dc4:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100dc7:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100dce:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100dd1:	0f b7 00             	movzwl (%eax),%eax
  100dd4:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100dd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ddb:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100de0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100de3:	0f b7 00             	movzwl (%eax),%eax
  100de6:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100dea:	74 12                	je     100dfe <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100dec:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100df3:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100dfa:	b4 03 
  100dfc:	eb 13                	jmp    100e11 <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100dfe:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e01:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e05:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e08:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e0f:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e11:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e18:	0f b7 c0             	movzwl %ax,%eax
  100e1b:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100e1f:	c6 45 ea 0e          	movb   $0xe,-0x16(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e23:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  100e27:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100e2b:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e2c:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e33:	83 c0 01             	add    $0x1,%eax
  100e36:	0f b7 c0             	movzwl %ax,%eax
  100e39:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e3d:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e41:	89 c2                	mov    %eax,%edx
  100e43:	ec                   	in     (%dx),%al
  100e44:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  100e47:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100e4b:	0f b6 c0             	movzbl %al,%eax
  100e4e:	c1 e0 08             	shl    $0x8,%eax
  100e51:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e54:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e5b:	0f b7 c0             	movzwl %ax,%eax
  100e5e:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
  100e62:	c6 45 ec 0f          	movb   $0xf,-0x14(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e66:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100e6a:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100e6e:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100e6f:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e76:	83 c0 01             	add    $0x1,%eax
  100e79:	0f b7 c0             	movzwl %ax,%eax
  100e7c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e80:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e84:	89 c2                	mov    %eax,%edx
  100e86:	ec                   	in     (%dx),%al
  100e87:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e8a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e8e:	0f b6 c0             	movzbl %al,%eax
  100e91:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100e94:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e97:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100e9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e9f:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ea5:	90                   	nop
  100ea6:	c9                   	leave  
  100ea7:	c3                   	ret    

00100ea8 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ea8:	55                   	push   %ebp
  100ea9:	89 e5                	mov    %esp,%ebp
  100eab:	83 ec 28             	sub    $0x28,%esp
  100eae:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100eb4:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eb8:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  100ebc:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ec0:	ee                   	out    %al,(%dx)
  100ec1:	66 c7 45 f4 fb 03    	movw   $0x3fb,-0xc(%ebp)
  100ec7:	c6 45 db 80          	movb   $0x80,-0x25(%ebp)
  100ecb:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100ecf:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  100ed3:	ee                   	out    %al,(%dx)
  100ed4:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  100eda:	c6 45 dc 0c          	movb   $0xc,-0x24(%ebp)
  100ede:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  100ee2:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100ee6:	ee                   	out    %al,(%dx)
  100ee7:	66 c7 45 f0 f9 03    	movw   $0x3f9,-0x10(%ebp)
  100eed:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100ef1:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100ef5:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  100ef9:	ee                   	out    %al,(%dx)
  100efa:	66 c7 45 ee fb 03    	movw   $0x3fb,-0x12(%ebp)
  100f00:	c6 45 de 03          	movb   $0x3,-0x22(%ebp)
  100f04:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100f08:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f0c:	ee                   	out    %al,(%dx)
  100f0d:	66 c7 45 ec fc 03    	movw   $0x3fc,-0x14(%ebp)
  100f13:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
  100f17:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100f1b:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  100f1f:	ee                   	out    %al,(%dx)
  100f20:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f26:	c6 45 e0 01          	movb   $0x1,-0x20(%ebp)
  100f2a:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f2e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f32:	ee                   	out    %al,(%dx)
  100f33:	66 c7 45 e8 fd 03    	movw   $0x3fd,-0x18(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f39:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
  100f3d:	89 c2                	mov    %eax,%edx
  100f3f:	ec                   	in     (%dx),%al
  100f40:	88 45 e1             	mov    %al,-0x1f(%ebp)
    return data;
  100f43:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f47:	3c ff                	cmp    $0xff,%al
  100f49:	0f 95 c0             	setne  %al
  100f4c:	0f b6 c0             	movzbl %al,%eax
  100f4f:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f54:	66 c7 45 e6 fa 03    	movw   $0x3fa,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f5a:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100f5e:	89 c2                	mov    %eax,%edx
  100f60:	ec                   	in     (%dx),%al
  100f61:	88 45 e2             	mov    %al,-0x1e(%ebp)
  100f64:	66 c7 45 e4 f8 03    	movw   $0x3f8,-0x1c(%ebp)
  100f6a:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
  100f6e:	89 c2                	mov    %eax,%edx
  100f70:	ec                   	in     (%dx),%al
  100f71:	88 45 e3             	mov    %al,-0x1d(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100f74:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100f79:	85 c0                	test   %eax,%eax
  100f7b:	74 0d                	je     100f8a <serial_init+0xe2>
        pic_enable(IRQ_COM1);
  100f7d:	83 ec 0c             	sub    $0xc,%esp
  100f80:	6a 04                	push   $0x4
  100f82:	e8 b9 06 00 00       	call   101640 <pic_enable>
  100f87:	83 c4 10             	add    $0x10,%esp
    }
}
  100f8a:	90                   	nop
  100f8b:	c9                   	leave  
  100f8c:	c3                   	ret    

00100f8d <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100f8d:	55                   	push   %ebp
  100f8e:	89 e5                	mov    %esp,%ebp
  100f90:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f93:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100f9a:	eb 09                	jmp    100fa5 <lpt_putc_sub+0x18>
        delay();
  100f9c:	e8 d7 fd ff ff       	call   100d78 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fa1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fa5:	66 c7 45 f4 79 03    	movw   $0x379,-0xc(%ebp)
  100fab:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100faf:	89 c2                	mov    %eax,%edx
  100fb1:	ec                   	in     (%dx),%al
  100fb2:	88 45 f3             	mov    %al,-0xd(%ebp)
    return data;
  100fb5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100fb9:	84 c0                	test   %al,%al
  100fbb:	78 09                	js     100fc6 <lpt_putc_sub+0x39>
  100fbd:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100fc4:	7e d6                	jle    100f9c <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fc6:	8b 45 08             	mov    0x8(%ebp),%eax
  100fc9:	0f b6 c0             	movzbl %al,%eax
  100fcc:	66 c7 45 f8 78 03    	movw   $0x378,-0x8(%ebp)
  100fd2:	88 45 f0             	mov    %al,-0x10(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd5:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100fd9:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  100fdd:	ee                   	out    %al,(%dx)
  100fde:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  100fe4:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  100fe8:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100fec:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ff0:	ee                   	out    %al,(%dx)
  100ff1:	66 c7 45 fa 7a 03    	movw   $0x37a,-0x6(%ebp)
  100ff7:	c6 45 f2 08          	movb   $0x8,-0xe(%ebp)
  100ffb:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
  100fff:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101003:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101004:	90                   	nop
  101005:	c9                   	leave  
  101006:	c3                   	ret    

00101007 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101007:	55                   	push   %ebp
  101008:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  10100a:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10100e:	74 0d                	je     10101d <lpt_putc+0x16>
        lpt_putc_sub(c);
  101010:	ff 75 08             	pushl  0x8(%ebp)
  101013:	e8 75 ff ff ff       	call   100f8d <lpt_putc_sub>
  101018:	83 c4 04             	add    $0x4,%esp
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  10101b:	eb 1e                	jmp    10103b <lpt_putc+0x34>
lpt_putc(int c) {
    if (c != '\b') {
        lpt_putc_sub(c);
    }
    else {
        lpt_putc_sub('\b');
  10101d:	6a 08                	push   $0x8
  10101f:	e8 69 ff ff ff       	call   100f8d <lpt_putc_sub>
  101024:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub(' ');
  101027:	6a 20                	push   $0x20
  101029:	e8 5f ff ff ff       	call   100f8d <lpt_putc_sub>
  10102e:	83 c4 04             	add    $0x4,%esp
        lpt_putc_sub('\b');
  101031:	6a 08                	push   $0x8
  101033:	e8 55 ff ff ff       	call   100f8d <lpt_putc_sub>
  101038:	83 c4 04             	add    $0x4,%esp
    }
}
  10103b:	90                   	nop
  10103c:	c9                   	leave  
  10103d:	c3                   	ret    

0010103e <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10103e:	55                   	push   %ebp
  10103f:	89 e5                	mov    %esp,%ebp
  101041:	53                   	push   %ebx
  101042:	83 ec 14             	sub    $0x14,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101045:	8b 45 08             	mov    0x8(%ebp),%eax
  101048:	b0 00                	mov    $0x0,%al
  10104a:	85 c0                	test   %eax,%eax
  10104c:	75 07                	jne    101055 <cga_putc+0x17>
        c |= 0x0700;
  10104e:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101055:	8b 45 08             	mov    0x8(%ebp),%eax
  101058:	0f b6 c0             	movzbl %al,%eax
  10105b:	83 f8 0a             	cmp    $0xa,%eax
  10105e:	74 4e                	je     1010ae <cga_putc+0x70>
  101060:	83 f8 0d             	cmp    $0xd,%eax
  101063:	74 59                	je     1010be <cga_putc+0x80>
  101065:	83 f8 08             	cmp    $0x8,%eax
  101068:	0f 85 8a 00 00 00    	jne    1010f8 <cga_putc+0xba>
    case '\b':
        if (crt_pos > 0) {
  10106e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101075:	66 85 c0             	test   %ax,%ax
  101078:	0f 84 a0 00 00 00    	je     10111e <cga_putc+0xe0>
            crt_pos --;
  10107e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101085:	83 e8 01             	sub    $0x1,%eax
  101088:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  10108e:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101093:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  10109a:	0f b7 d2             	movzwl %dx,%edx
  10109d:	01 d2                	add    %edx,%edx
  10109f:	01 d0                	add    %edx,%eax
  1010a1:	8b 55 08             	mov    0x8(%ebp),%edx
  1010a4:	b2 00                	mov    $0x0,%dl
  1010a6:	83 ca 20             	or     $0x20,%edx
  1010a9:	66 89 10             	mov    %dx,(%eax)
        }
        break;
  1010ac:	eb 70                	jmp    10111e <cga_putc+0xe0>
    case '\n':
        crt_pos += CRT_COLS;
  1010ae:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010b5:	83 c0 50             	add    $0x50,%eax
  1010b8:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010be:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  1010c5:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  1010cc:	0f b7 c1             	movzwl %cx,%eax
  1010cf:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1010d5:	c1 e8 10             	shr    $0x10,%eax
  1010d8:	89 c2                	mov    %eax,%edx
  1010da:	66 c1 ea 06          	shr    $0x6,%dx
  1010de:	89 d0                	mov    %edx,%eax
  1010e0:	c1 e0 02             	shl    $0x2,%eax
  1010e3:	01 d0                	add    %edx,%eax
  1010e5:	c1 e0 04             	shl    $0x4,%eax
  1010e8:	29 c1                	sub    %eax,%ecx
  1010ea:	89 ca                	mov    %ecx,%edx
  1010ec:	89 d8                	mov    %ebx,%eax
  1010ee:	29 d0                	sub    %edx,%eax
  1010f0:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  1010f6:	eb 27                	jmp    10111f <cga_putc+0xe1>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1010f8:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  1010fe:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101105:	8d 50 01             	lea    0x1(%eax),%edx
  101108:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10110f:	0f b7 c0             	movzwl %ax,%eax
  101112:	01 c0                	add    %eax,%eax
  101114:	01 c8                	add    %ecx,%eax
  101116:	8b 55 08             	mov    0x8(%ebp),%edx
  101119:	66 89 10             	mov    %dx,(%eax)
        break;
  10111c:	eb 01                	jmp    10111f <cga_putc+0xe1>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  10111e:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10111f:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101126:	66 3d cf 07          	cmp    $0x7cf,%ax
  10112a:	76 59                	jbe    101185 <cga_putc+0x147>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10112c:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101131:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101137:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10113c:	83 ec 04             	sub    $0x4,%esp
  10113f:	68 00 0f 00 00       	push   $0xf00
  101144:	52                   	push   %edx
  101145:	50                   	push   %eax
  101146:	e8 c5 1a 00 00       	call   102c10 <memmove>
  10114b:	83 c4 10             	add    $0x10,%esp
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10114e:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101155:	eb 15                	jmp    10116c <cga_putc+0x12e>
            crt_buf[i] = 0x0700 | ' ';
  101157:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10115c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10115f:	01 d2                	add    %edx,%edx
  101161:	01 d0                	add    %edx,%eax
  101163:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101168:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10116c:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101173:	7e e2                	jle    101157 <cga_putc+0x119>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  101175:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10117c:	83 e8 50             	sub    $0x50,%eax
  10117f:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101185:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10118c:	0f b7 c0             	movzwl %ax,%eax
  10118f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  101193:	c6 45 e8 0e          	movb   $0xe,-0x18(%ebp)
  101197:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  10119b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10119f:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011a0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011a7:	66 c1 e8 08          	shr    $0x8,%ax
  1011ab:	0f b6 c0             	movzbl %al,%eax
  1011ae:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011b5:	83 c2 01             	add    $0x1,%edx
  1011b8:	0f b7 d2             	movzwl %dx,%edx
  1011bb:	66 89 55 f0          	mov    %dx,-0x10(%ebp)
  1011bf:	88 45 e9             	mov    %al,-0x17(%ebp)
  1011c2:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1011c6:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  1011ca:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  1011cb:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011d2:	0f b7 c0             	movzwl %ax,%eax
  1011d5:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1011d9:	c6 45 ea 0f          	movb   $0xf,-0x16(%ebp)
  1011dd:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  1011e1:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1011e5:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  1011e6:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011ed:	0f b6 c0             	movzbl %al,%eax
  1011f0:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011f7:	83 c2 01             	add    $0x1,%edx
  1011fa:	0f b7 d2             	movzwl %dx,%edx
  1011fd:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
  101201:	88 45 eb             	mov    %al,-0x15(%ebp)
  101204:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  101208:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  10120c:	ee                   	out    %al,(%dx)
}
  10120d:	90                   	nop
  10120e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101211:	c9                   	leave  
  101212:	c3                   	ret    

00101213 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101213:	55                   	push   %ebp
  101214:	89 e5                	mov    %esp,%ebp
  101216:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101219:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101220:	eb 09                	jmp    10122b <serial_putc_sub+0x18>
        delay();
  101222:	e8 51 fb ff ff       	call   100d78 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101227:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10122b:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101231:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  101235:	89 c2                	mov    %eax,%edx
  101237:	ec                   	in     (%dx),%al
  101238:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  10123b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10123f:	0f b6 c0             	movzbl %al,%eax
  101242:	83 e0 20             	and    $0x20,%eax
  101245:	85 c0                	test   %eax,%eax
  101247:	75 09                	jne    101252 <serial_putc_sub+0x3f>
  101249:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101250:	7e d0                	jle    101222 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  101252:	8b 45 08             	mov    0x8(%ebp),%eax
  101255:	0f b6 c0             	movzbl %al,%eax
  101258:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
  10125e:	88 45 f6             	mov    %al,-0xa(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101261:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  101265:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101269:	ee                   	out    %al,(%dx)
}
  10126a:	90                   	nop
  10126b:	c9                   	leave  
  10126c:	c3                   	ret    

0010126d <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  10126d:	55                   	push   %ebp
  10126e:	89 e5                	mov    %esp,%ebp
    if (c != '\b') {
  101270:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101274:	74 0d                	je     101283 <serial_putc+0x16>
        serial_putc_sub(c);
  101276:	ff 75 08             	pushl  0x8(%ebp)
  101279:	e8 95 ff ff ff       	call   101213 <serial_putc_sub>
  10127e:	83 c4 04             	add    $0x4,%esp
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101281:	eb 1e                	jmp    1012a1 <serial_putc+0x34>
serial_putc(int c) {
    if (c != '\b') {
        serial_putc_sub(c);
    }
    else {
        serial_putc_sub('\b');
  101283:	6a 08                	push   $0x8
  101285:	e8 89 ff ff ff       	call   101213 <serial_putc_sub>
  10128a:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub(' ');
  10128d:	6a 20                	push   $0x20
  10128f:	e8 7f ff ff ff       	call   101213 <serial_putc_sub>
  101294:	83 c4 04             	add    $0x4,%esp
        serial_putc_sub('\b');
  101297:	6a 08                	push   $0x8
  101299:	e8 75 ff ff ff       	call   101213 <serial_putc_sub>
  10129e:	83 c4 04             	add    $0x4,%esp
    }
}
  1012a1:	90                   	nop
  1012a2:	c9                   	leave  
  1012a3:	c3                   	ret    

001012a4 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012a4:	55                   	push   %ebp
  1012a5:	89 e5                	mov    %esp,%ebp
  1012a7:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012aa:	eb 33                	jmp    1012df <cons_intr+0x3b>
        if (c != 0) {
  1012ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012b0:	74 2d                	je     1012df <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012b2:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012b7:	8d 50 01             	lea    0x1(%eax),%edx
  1012ba:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  1012c0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1012c3:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1012c9:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012ce:	3d 00 02 00 00       	cmp    $0x200,%eax
  1012d3:	75 0a                	jne    1012df <cons_intr+0x3b>
                cons.wpos = 0;
  1012d5:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  1012dc:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  1012df:	8b 45 08             	mov    0x8(%ebp),%eax
  1012e2:	ff d0                	call   *%eax
  1012e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1012e7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1012eb:	75 bf                	jne    1012ac <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  1012ed:	90                   	nop
  1012ee:	c9                   	leave  
  1012ef:	c3                   	ret    

001012f0 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1012f0:	55                   	push   %ebp
  1012f1:	89 e5                	mov    %esp,%ebp
  1012f3:	83 ec 10             	sub    $0x10,%esp
  1012f6:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012fc:	0f b7 45 f8          	movzwl -0x8(%ebp),%eax
  101300:	89 c2                	mov    %eax,%edx
  101302:	ec                   	in     (%dx),%al
  101303:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101306:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10130a:	0f b6 c0             	movzbl %al,%eax
  10130d:	83 e0 01             	and    $0x1,%eax
  101310:	85 c0                	test   %eax,%eax
  101312:	75 07                	jne    10131b <serial_proc_data+0x2b>
        return -1;
  101314:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101319:	eb 2a                	jmp    101345 <serial_proc_data+0x55>
  10131b:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101321:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101325:	89 c2                	mov    %eax,%edx
  101327:	ec                   	in     (%dx),%al
  101328:	88 45 f6             	mov    %al,-0xa(%ebp)
    return data;
  10132b:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10132f:	0f b6 c0             	movzbl %al,%eax
  101332:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101335:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101339:	75 07                	jne    101342 <serial_proc_data+0x52>
        c = '\b';
  10133b:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101342:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101345:	c9                   	leave  
  101346:	c3                   	ret    

00101347 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101347:	55                   	push   %ebp
  101348:	89 e5                	mov    %esp,%ebp
  10134a:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  10134d:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101352:	85 c0                	test   %eax,%eax
  101354:	74 10                	je     101366 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101356:	83 ec 0c             	sub    $0xc,%esp
  101359:	68 f0 12 10 00       	push   $0x1012f0
  10135e:	e8 41 ff ff ff       	call   1012a4 <cons_intr>
  101363:	83 c4 10             	add    $0x10,%esp
    }
}
  101366:	90                   	nop
  101367:	c9                   	leave  
  101368:	c3                   	ret    

00101369 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101369:	55                   	push   %ebp
  10136a:	89 e5                	mov    %esp,%ebp
  10136c:	83 ec 18             	sub    $0x18,%esp
  10136f:	66 c7 45 ec 64 00    	movw   $0x64,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101375:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101379:	89 c2                	mov    %eax,%edx
  10137b:	ec                   	in     (%dx),%al
  10137c:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  10137f:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101383:	0f b6 c0             	movzbl %al,%eax
  101386:	83 e0 01             	and    $0x1,%eax
  101389:	85 c0                	test   %eax,%eax
  10138b:	75 0a                	jne    101397 <kbd_proc_data+0x2e>
        return -1;
  10138d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101392:	e9 5d 01 00 00       	jmp    1014f4 <kbd_proc_data+0x18b>
  101397:	66 c7 45 f0 60 00    	movw   $0x60,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10139d:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013a1:	89 c2                	mov    %eax,%edx
  1013a3:	ec                   	in     (%dx),%al
  1013a4:	88 45 ea             	mov    %al,-0x16(%ebp)
    return data;
  1013a7:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013ab:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013ae:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013b2:	75 17                	jne    1013cb <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013b4:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013b9:	83 c8 40             	or     $0x40,%eax
  1013bc:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1013c1:	b8 00 00 00 00       	mov    $0x0,%eax
  1013c6:	e9 29 01 00 00       	jmp    1014f4 <kbd_proc_data+0x18b>
    } else if (data & 0x80) {
  1013cb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013cf:	84 c0                	test   %al,%al
  1013d1:	79 47                	jns    10141a <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1013d3:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013d8:	83 e0 40             	and    $0x40,%eax
  1013db:	85 c0                	test   %eax,%eax
  1013dd:	75 09                	jne    1013e8 <kbd_proc_data+0x7f>
  1013df:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013e3:	83 e0 7f             	and    $0x7f,%eax
  1013e6:	eb 04                	jmp    1013ec <kbd_proc_data+0x83>
  1013e8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013ec:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1013ef:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013f3:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1013fa:	83 c8 40             	or     $0x40,%eax
  1013fd:	0f b6 c0             	movzbl %al,%eax
  101400:	f7 d0                	not    %eax
  101402:	89 c2                	mov    %eax,%edx
  101404:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101409:	21 d0                	and    %edx,%eax
  10140b:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101410:	b8 00 00 00 00       	mov    $0x0,%eax
  101415:	e9 da 00 00 00       	jmp    1014f4 <kbd_proc_data+0x18b>
    } else if (shift & E0ESC) {
  10141a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10141f:	83 e0 40             	and    $0x40,%eax
  101422:	85 c0                	test   %eax,%eax
  101424:	74 11                	je     101437 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101426:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10142a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10142f:	83 e0 bf             	and    $0xffffffbf,%eax
  101432:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101437:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143b:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101442:	0f b6 d0             	movzbl %al,%edx
  101445:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10144a:	09 d0                	or     %edx,%eax
  10144c:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  101451:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101455:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  10145c:	0f b6 d0             	movzbl %al,%edx
  10145f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101464:	31 d0                	xor    %edx,%eax
  101466:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  10146b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101470:	83 e0 03             	and    $0x3,%eax
  101473:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  10147a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10147e:	01 d0                	add    %edx,%eax
  101480:	0f b6 00             	movzbl (%eax),%eax
  101483:	0f b6 c0             	movzbl %al,%eax
  101486:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101489:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10148e:	83 e0 08             	and    $0x8,%eax
  101491:	85 c0                	test   %eax,%eax
  101493:	74 22                	je     1014b7 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  101495:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101499:	7e 0c                	jle    1014a7 <kbd_proc_data+0x13e>
  10149b:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10149f:	7f 06                	jg     1014a7 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014a1:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014a5:	eb 10                	jmp    1014b7 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014a7:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014ab:	7e 0a                	jle    1014b7 <kbd_proc_data+0x14e>
  1014ad:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014b1:	7f 04                	jg     1014b7 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014b3:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014b7:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014bc:	f7 d0                	not    %eax
  1014be:	83 e0 06             	and    $0x6,%eax
  1014c1:	85 c0                	test   %eax,%eax
  1014c3:	75 2c                	jne    1014f1 <kbd_proc_data+0x188>
  1014c5:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1014cc:	75 23                	jne    1014f1 <kbd_proc_data+0x188>
        cprintf("Rebooting!\n");
  1014ce:	83 ec 0c             	sub    $0xc,%esp
  1014d1:	68 7d 36 10 00       	push   $0x10367d
  1014d6:	e8 57 ed ff ff       	call   100232 <cprintf>
  1014db:	83 c4 10             	add    $0x10,%esp
  1014de:	66 c7 45 ee 92 00    	movw   $0x92,-0x12(%ebp)
  1014e4:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1014e8:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1014ec:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1014f0:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1014f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1014f4:	c9                   	leave  
  1014f5:	c3                   	ret    

001014f6 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1014f6:	55                   	push   %ebp
  1014f7:	89 e5                	mov    %esp,%ebp
  1014f9:	83 ec 08             	sub    $0x8,%esp
    cons_intr(kbd_proc_data);
  1014fc:	83 ec 0c             	sub    $0xc,%esp
  1014ff:	68 69 13 10 00       	push   $0x101369
  101504:	e8 9b fd ff ff       	call   1012a4 <cons_intr>
  101509:	83 c4 10             	add    $0x10,%esp
}
  10150c:	90                   	nop
  10150d:	c9                   	leave  
  10150e:	c3                   	ret    

0010150f <kbd_init>:

static void
kbd_init(void) {
  10150f:	55                   	push   %ebp
  101510:	89 e5                	mov    %esp,%ebp
  101512:	83 ec 08             	sub    $0x8,%esp
    // drain the kbd buffer
    kbd_intr();
  101515:	e8 dc ff ff ff       	call   1014f6 <kbd_intr>
    pic_enable(IRQ_KBD);
  10151a:	83 ec 0c             	sub    $0xc,%esp
  10151d:	6a 01                	push   $0x1
  10151f:	e8 1c 01 00 00       	call   101640 <pic_enable>
  101524:	83 c4 10             	add    $0x10,%esp
}
  101527:	90                   	nop
  101528:	c9                   	leave  
  101529:	c3                   	ret    

0010152a <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10152a:	55                   	push   %ebp
  10152b:	89 e5                	mov    %esp,%ebp
  10152d:	83 ec 08             	sub    $0x8,%esp
    cga_init();
  101530:	e8 8c f8 ff ff       	call   100dc1 <cga_init>
    serial_init();
  101535:	e8 6e f9 ff ff       	call   100ea8 <serial_init>
    kbd_init();
  10153a:	e8 d0 ff ff ff       	call   10150f <kbd_init>
    if (!serial_exists) {
  10153f:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101544:	85 c0                	test   %eax,%eax
  101546:	75 10                	jne    101558 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101548:	83 ec 0c             	sub    $0xc,%esp
  10154b:	68 89 36 10 00       	push   $0x103689
  101550:	e8 dd ec ff ff       	call   100232 <cprintf>
  101555:	83 c4 10             	add    $0x10,%esp
    }
}
  101558:	90                   	nop
  101559:	c9                   	leave  
  10155a:	c3                   	ret    

0010155b <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10155b:	55                   	push   %ebp
  10155c:	89 e5                	mov    %esp,%ebp
  10155e:	83 ec 08             	sub    $0x8,%esp
    lpt_putc(c);
  101561:	ff 75 08             	pushl  0x8(%ebp)
  101564:	e8 9e fa ff ff       	call   101007 <lpt_putc>
  101569:	83 c4 04             	add    $0x4,%esp
    cga_putc(c);
  10156c:	83 ec 0c             	sub    $0xc,%esp
  10156f:	ff 75 08             	pushl  0x8(%ebp)
  101572:	e8 c7 fa ff ff       	call   10103e <cga_putc>
  101577:	83 c4 10             	add    $0x10,%esp
    serial_putc(c);
  10157a:	83 ec 0c             	sub    $0xc,%esp
  10157d:	ff 75 08             	pushl  0x8(%ebp)
  101580:	e8 e8 fc ff ff       	call   10126d <serial_putc>
  101585:	83 c4 10             	add    $0x10,%esp
}
  101588:	90                   	nop
  101589:	c9                   	leave  
  10158a:	c3                   	ret    

0010158b <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  10158b:	55                   	push   %ebp
  10158c:	89 e5                	mov    %esp,%ebp
  10158e:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101591:	e8 b1 fd ff ff       	call   101347 <serial_intr>
    kbd_intr();
  101596:	e8 5b ff ff ff       	call   1014f6 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  10159b:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015a1:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015a6:	39 c2                	cmp    %eax,%edx
  1015a8:	74 36                	je     1015e0 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015aa:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015af:	8d 50 01             	lea    0x1(%eax),%edx
  1015b2:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015b8:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015bf:	0f b6 c0             	movzbl %al,%eax
  1015c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015c5:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015ca:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015cf:	75 0a                	jne    1015db <cons_getc+0x50>
            cons.rpos = 0;
  1015d1:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  1015d8:	00 00 00 
        }
        return c;
  1015db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1015de:	eb 05                	jmp    1015e5 <cons_getc+0x5a>
    }
    return 0;
  1015e0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1015e5:	c9                   	leave  
  1015e6:	c3                   	ret    

001015e7 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1015e7:	55                   	push   %ebp
  1015e8:	89 e5                	mov    %esp,%ebp
  1015ea:	83 ec 14             	sub    $0x14,%esp
  1015ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1015f0:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1015f4:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1015f8:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  1015fe:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101603:	85 c0                	test   %eax,%eax
  101605:	74 36                	je     10163d <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101607:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10160b:	0f b6 c0             	movzbl %al,%eax
  10160e:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101614:	88 45 fa             	mov    %al,-0x6(%ebp)
  101617:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  10161b:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10161f:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101620:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101624:	66 c1 e8 08          	shr    $0x8,%ax
  101628:	0f b6 c0             	movzbl %al,%eax
  10162b:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  101631:	88 45 fb             	mov    %al,-0x5(%ebp)
  101634:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  101638:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  10163c:	ee                   	out    %al,(%dx)
    }
}
  10163d:	90                   	nop
  10163e:	c9                   	leave  
  10163f:	c3                   	ret    

00101640 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101640:	55                   	push   %ebp
  101641:	89 e5                	mov    %esp,%ebp
    pic_setmask(irq_mask & ~(1 << irq));
  101643:	8b 45 08             	mov    0x8(%ebp),%eax
  101646:	ba 01 00 00 00       	mov    $0x1,%edx
  10164b:	89 c1                	mov    %eax,%ecx
  10164d:	d3 e2                	shl    %cl,%edx
  10164f:	89 d0                	mov    %edx,%eax
  101651:	f7 d0                	not    %eax
  101653:	89 c2                	mov    %eax,%edx
  101655:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10165c:	21 d0                	and    %edx,%eax
  10165e:	0f b7 c0             	movzwl %ax,%eax
  101661:	50                   	push   %eax
  101662:	e8 80 ff ff ff       	call   1015e7 <pic_setmask>
  101667:	83 c4 04             	add    $0x4,%esp
}
  10166a:	90                   	nop
  10166b:	c9                   	leave  
  10166c:	c3                   	ret    

0010166d <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10166d:	55                   	push   %ebp
  10166e:	89 e5                	mov    %esp,%ebp
  101670:	83 ec 30             	sub    $0x30,%esp
    did_init = 1;
  101673:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  10167a:	00 00 00 
  10167d:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101683:	c6 45 d6 ff          	movb   $0xff,-0x2a(%ebp)
  101687:	0f b6 45 d6          	movzbl -0x2a(%ebp),%eax
  10168b:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10168f:	ee                   	out    %al,(%dx)
  101690:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  101696:	c6 45 d7 ff          	movb   $0xff,-0x29(%ebp)
  10169a:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  10169e:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
  1016a2:	ee                   	out    %al,(%dx)
  1016a3:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  1016a9:	c6 45 d8 11          	movb   $0x11,-0x28(%ebp)
  1016ad:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  1016b1:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016b5:	ee                   	out    %al,(%dx)
  1016b6:	66 c7 45 f8 21 00    	movw   $0x21,-0x8(%ebp)
  1016bc:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
  1016c0:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1016c4:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  1016c8:	ee                   	out    %al,(%dx)
  1016c9:	66 c7 45 f6 21 00    	movw   $0x21,-0xa(%ebp)
  1016cf:	c6 45 da 04          	movb   $0x4,-0x26(%ebp)
  1016d3:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  1016d7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016db:	ee                   	out    %al,(%dx)
  1016dc:	66 c7 45 f4 21 00    	movw   $0x21,-0xc(%ebp)
  1016e2:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  1016e6:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  1016ea:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
  1016ee:	ee                   	out    %al,(%dx)
  1016ef:	66 c7 45 f2 a0 00    	movw   $0xa0,-0xe(%ebp)
  1016f5:	c6 45 dc 11          	movb   $0x11,-0x24(%ebp)
  1016f9:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  1016fd:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101701:	ee                   	out    %al,(%dx)
  101702:	66 c7 45 f0 a1 00    	movw   $0xa1,-0x10(%ebp)
  101708:	c6 45 dd 28          	movb   $0x28,-0x23(%ebp)
  10170c:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101710:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  101714:	ee                   	out    %al,(%dx)
  101715:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10171b:	c6 45 de 02          	movb   $0x2,-0x22(%ebp)
  10171f:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  101723:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101727:	ee                   	out    %al,(%dx)
  101728:	66 c7 45 ec a1 00    	movw   $0xa1,-0x14(%ebp)
  10172e:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  101732:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  101736:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  10173a:	ee                   	out    %al,(%dx)
  10173b:	66 c7 45 ea 20 00    	movw   $0x20,-0x16(%ebp)
  101741:	c6 45 e0 68          	movb   $0x68,-0x20(%ebp)
  101745:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  101749:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10174d:	ee                   	out    %al,(%dx)
  10174e:	66 c7 45 e8 20 00    	movw   $0x20,-0x18(%ebp)
  101754:	c6 45 e1 0a          	movb   $0xa,-0x1f(%ebp)
  101758:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10175c:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101760:	ee                   	out    %al,(%dx)
  101761:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101767:	c6 45 e2 68          	movb   $0x68,-0x1e(%ebp)
  10176b:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  10176f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101773:	ee                   	out    %al,(%dx)
  101774:	66 c7 45 e4 a0 00    	movw   $0xa0,-0x1c(%ebp)
  10177a:	c6 45 e3 0a          	movb   $0xa,-0x1d(%ebp)
  10177e:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  101782:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
  101786:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101787:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10178e:	66 83 f8 ff          	cmp    $0xffff,%ax
  101792:	74 13                	je     1017a7 <pic_init+0x13a>
        pic_setmask(irq_mask);
  101794:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10179b:	0f b7 c0             	movzwl %ax,%eax
  10179e:	50                   	push   %eax
  10179f:	e8 43 fe ff ff       	call   1015e7 <pic_setmask>
  1017a4:	83 c4 04             	add    $0x4,%esp
    }
}
  1017a7:	90                   	nop
  1017a8:	c9                   	leave  
  1017a9:	c3                   	ret    

001017aa <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017aa:	55                   	push   %ebp
  1017ab:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017ad:	fb                   	sti    
    sti();
}
  1017ae:	90                   	nop
  1017af:	5d                   	pop    %ebp
  1017b0:	c3                   	ret    

001017b1 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017b1:	55                   	push   %ebp
  1017b2:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017b4:	fa                   	cli    
    cli();
}
  1017b5:	90                   	nop
  1017b6:	5d                   	pop    %ebp
  1017b7:	c3                   	ret    

001017b8 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017b8:	55                   	push   %ebp
  1017b9:	89 e5                	mov    %esp,%ebp
  1017bb:	83 ec 08             	sub    $0x8,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017be:	83 ec 08             	sub    $0x8,%esp
  1017c1:	6a 64                	push   $0x64
  1017c3:	68 c0 36 10 00       	push   $0x1036c0
  1017c8:	e8 65 ea ff ff       	call   100232 <cprintf>
  1017cd:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1017d0:	90                   	nop
  1017d1:	c9                   	leave  
  1017d2:	c3                   	ret    

001017d3 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1017d3:	55                   	push   %ebp
  1017d4:	89 e5                	mov    %esp,%ebp
  1017d6:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    int i;
    extern uintptr_t __vectors[];
    for (i = 0; i < sizeof(idt)/sizeof(struct gatedesc); i++)
  1017d9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1017e0:	e9 c3 00 00 00       	jmp    1018a8 <idt_init+0xd5>
    {
        SETGATE (idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL); 
  1017e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017e8:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1017ef:	89 c2                	mov    %eax,%edx
  1017f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017f4:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  1017fb:	00 
  1017fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1017ff:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101806:	00 08 00 
  101809:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10180c:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101813:	00 
  101814:	83 e2 e0             	and    $0xffffffe0,%edx
  101817:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10181e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101821:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101828:	00 
  101829:	83 e2 1f             	and    $0x1f,%edx
  10182c:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101833:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101836:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10183d:	00 
  10183e:	83 e2 f0             	and    $0xfffffff0,%edx
  101841:	83 ca 0e             	or     $0xe,%edx
  101844:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10184b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10184e:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101855:	00 
  101856:	83 e2 ef             	and    $0xffffffef,%edx
  101859:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101860:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101863:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10186a:	00 
  10186b:	83 e2 9f             	and    $0xffffff9f,%edx
  10186e:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101875:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101878:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10187f:	00 
  101880:	83 ca 80             	or     $0xffffff80,%edx
  101883:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10188a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10188d:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101894:	c1 e8 10             	shr    $0x10,%eax
  101897:	89 c2                	mov    %eax,%edx
  101899:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10189c:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018a3:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    int i;
    extern uintptr_t __vectors[];
    for (i = 0; i < sizeof(idt)/sizeof(struct gatedesc); i++)
  1018a4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ab:	3d ff 00 00 00       	cmp    $0xff,%eax
  1018b0:	0f 86 2f ff ff ff    	jbe    1017e5 <idt_init+0x12>
  1018b6:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  1018bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1018c0:	0f 01 18             	lidtl  (%eax)
    {
        SETGATE (idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL); 
    }
    lidt (&idt_pd);
}
  1018c3:	90                   	nop
  1018c4:	c9                   	leave  
  1018c5:	c3                   	ret    

001018c6 <trapname>:

static const char *
trapname(int trapno) {
  1018c6:	55                   	push   %ebp
  1018c7:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1018c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1018cc:	83 f8 13             	cmp    $0x13,%eax
  1018cf:	77 0c                	ja     1018dd <trapname+0x17>
        return excnames[trapno];
  1018d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1018d4:	8b 04 85 20 3a 10 00 	mov    0x103a20(,%eax,4),%eax
  1018db:	eb 18                	jmp    1018f5 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1018dd:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1018e1:	7e 0d                	jle    1018f0 <trapname+0x2a>
  1018e3:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1018e7:	7f 07                	jg     1018f0 <trapname+0x2a>
        return "Hardware Interrupt";
  1018e9:	b8 ca 36 10 00       	mov    $0x1036ca,%eax
  1018ee:	eb 05                	jmp    1018f5 <trapname+0x2f>
    }
    return "(unknown trap)";
  1018f0:	b8 dd 36 10 00       	mov    $0x1036dd,%eax
}
  1018f5:	5d                   	pop    %ebp
  1018f6:	c3                   	ret    

001018f7 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1018f7:	55                   	push   %ebp
  1018f8:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1018fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1018fd:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101901:	66 83 f8 08          	cmp    $0x8,%ax
  101905:	0f 94 c0             	sete   %al
  101908:	0f b6 c0             	movzbl %al,%eax
}
  10190b:	5d                   	pop    %ebp
  10190c:	c3                   	ret    

0010190d <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  10190d:	55                   	push   %ebp
  10190e:	89 e5                	mov    %esp,%ebp
  101910:	83 ec 18             	sub    $0x18,%esp
    cprintf("trapframe at %p\n", tf);
  101913:	83 ec 08             	sub    $0x8,%esp
  101916:	ff 75 08             	pushl  0x8(%ebp)
  101919:	68 1e 37 10 00       	push   $0x10371e
  10191e:	e8 0f e9 ff ff       	call   100232 <cprintf>
  101923:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101926:	8b 45 08             	mov    0x8(%ebp),%eax
  101929:	83 ec 0c             	sub    $0xc,%esp
  10192c:	50                   	push   %eax
  10192d:	e8 b8 01 00 00       	call   101aea <print_regs>
  101932:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101935:	8b 45 08             	mov    0x8(%ebp),%eax
  101938:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  10193c:	0f b7 c0             	movzwl %ax,%eax
  10193f:	83 ec 08             	sub    $0x8,%esp
  101942:	50                   	push   %eax
  101943:	68 2f 37 10 00       	push   $0x10372f
  101948:	e8 e5 e8 ff ff       	call   100232 <cprintf>
  10194d:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101950:	8b 45 08             	mov    0x8(%ebp),%eax
  101953:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101957:	0f b7 c0             	movzwl %ax,%eax
  10195a:	83 ec 08             	sub    $0x8,%esp
  10195d:	50                   	push   %eax
  10195e:	68 42 37 10 00       	push   $0x103742
  101963:	e8 ca e8 ff ff       	call   100232 <cprintf>
  101968:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  10196b:	8b 45 08             	mov    0x8(%ebp),%eax
  10196e:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101972:	0f b7 c0             	movzwl %ax,%eax
  101975:	83 ec 08             	sub    $0x8,%esp
  101978:	50                   	push   %eax
  101979:	68 55 37 10 00       	push   $0x103755
  10197e:	e8 af e8 ff ff       	call   100232 <cprintf>
  101983:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101986:	8b 45 08             	mov    0x8(%ebp),%eax
  101989:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  10198d:	0f b7 c0             	movzwl %ax,%eax
  101990:	83 ec 08             	sub    $0x8,%esp
  101993:	50                   	push   %eax
  101994:	68 68 37 10 00       	push   $0x103768
  101999:	e8 94 e8 ff ff       	call   100232 <cprintf>
  10199e:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1019a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a4:	8b 40 30             	mov    0x30(%eax),%eax
  1019a7:	83 ec 0c             	sub    $0xc,%esp
  1019aa:	50                   	push   %eax
  1019ab:	e8 16 ff ff ff       	call   1018c6 <trapname>
  1019b0:	83 c4 10             	add    $0x10,%esp
  1019b3:	89 c2                	mov    %eax,%edx
  1019b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b8:	8b 40 30             	mov    0x30(%eax),%eax
  1019bb:	83 ec 04             	sub    $0x4,%esp
  1019be:	52                   	push   %edx
  1019bf:	50                   	push   %eax
  1019c0:	68 7b 37 10 00       	push   $0x10377b
  1019c5:	e8 68 e8 ff ff       	call   100232 <cprintf>
  1019ca:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  1019cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d0:	8b 40 34             	mov    0x34(%eax),%eax
  1019d3:	83 ec 08             	sub    $0x8,%esp
  1019d6:	50                   	push   %eax
  1019d7:	68 8d 37 10 00       	push   $0x10378d
  1019dc:	e8 51 e8 ff ff       	call   100232 <cprintf>
  1019e1:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  1019e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019e7:	8b 40 38             	mov    0x38(%eax),%eax
  1019ea:	83 ec 08             	sub    $0x8,%esp
  1019ed:	50                   	push   %eax
  1019ee:	68 9c 37 10 00       	push   $0x10379c
  1019f3:	e8 3a e8 ff ff       	call   100232 <cprintf>
  1019f8:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  1019fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1019fe:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a02:	0f b7 c0             	movzwl %ax,%eax
  101a05:	83 ec 08             	sub    $0x8,%esp
  101a08:	50                   	push   %eax
  101a09:	68 ab 37 10 00       	push   $0x1037ab
  101a0e:	e8 1f e8 ff ff       	call   100232 <cprintf>
  101a13:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a16:	8b 45 08             	mov    0x8(%ebp),%eax
  101a19:	8b 40 40             	mov    0x40(%eax),%eax
  101a1c:	83 ec 08             	sub    $0x8,%esp
  101a1f:	50                   	push   %eax
  101a20:	68 be 37 10 00       	push   $0x1037be
  101a25:	e8 08 e8 ff ff       	call   100232 <cprintf>
  101a2a:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a2d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101a34:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101a3b:	eb 3f                	jmp    101a7c <print_trapframe+0x16f>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101a3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a40:	8b 50 40             	mov    0x40(%eax),%edx
  101a43:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a46:	21 d0                	and    %edx,%eax
  101a48:	85 c0                	test   %eax,%eax
  101a4a:	74 29                	je     101a75 <print_trapframe+0x168>
  101a4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a4f:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a56:	85 c0                	test   %eax,%eax
  101a58:	74 1b                	je     101a75 <print_trapframe+0x168>
            cprintf("%s,", IA32flags[i]);
  101a5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a5d:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a64:	83 ec 08             	sub    $0x8,%esp
  101a67:	50                   	push   %eax
  101a68:	68 cd 37 10 00       	push   $0x1037cd
  101a6d:	e8 c0 e7 ff ff       	call   100232 <cprintf>
  101a72:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a75:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101a79:	d1 65 f0             	shll   -0x10(%ebp)
  101a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a7f:	83 f8 17             	cmp    $0x17,%eax
  101a82:	76 b9                	jbe    101a3d <print_trapframe+0x130>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101a84:	8b 45 08             	mov    0x8(%ebp),%eax
  101a87:	8b 40 40             	mov    0x40(%eax),%eax
  101a8a:	25 00 30 00 00       	and    $0x3000,%eax
  101a8f:	c1 e8 0c             	shr    $0xc,%eax
  101a92:	83 ec 08             	sub    $0x8,%esp
  101a95:	50                   	push   %eax
  101a96:	68 d1 37 10 00       	push   $0x1037d1
  101a9b:	e8 92 e7 ff ff       	call   100232 <cprintf>
  101aa0:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101aa3:	83 ec 0c             	sub    $0xc,%esp
  101aa6:	ff 75 08             	pushl  0x8(%ebp)
  101aa9:	e8 49 fe ff ff       	call   1018f7 <trap_in_kernel>
  101aae:	83 c4 10             	add    $0x10,%esp
  101ab1:	85 c0                	test   %eax,%eax
  101ab3:	75 32                	jne    101ae7 <print_trapframe+0x1da>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101ab5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab8:	8b 40 44             	mov    0x44(%eax),%eax
  101abb:	83 ec 08             	sub    $0x8,%esp
  101abe:	50                   	push   %eax
  101abf:	68 da 37 10 00       	push   $0x1037da
  101ac4:	e8 69 e7 ff ff       	call   100232 <cprintf>
  101ac9:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101acc:	8b 45 08             	mov    0x8(%ebp),%eax
  101acf:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101ad3:	0f b7 c0             	movzwl %ax,%eax
  101ad6:	83 ec 08             	sub    $0x8,%esp
  101ad9:	50                   	push   %eax
  101ada:	68 e9 37 10 00       	push   $0x1037e9
  101adf:	e8 4e e7 ff ff       	call   100232 <cprintf>
  101ae4:	83 c4 10             	add    $0x10,%esp
    }
}
  101ae7:	90                   	nop
  101ae8:	c9                   	leave  
  101ae9:	c3                   	ret    

00101aea <print_regs>:

void
print_regs(struct pushregs *regs) {
  101aea:	55                   	push   %ebp
  101aeb:	89 e5                	mov    %esp,%ebp
  101aed:	83 ec 08             	sub    $0x8,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101af0:	8b 45 08             	mov    0x8(%ebp),%eax
  101af3:	8b 00                	mov    (%eax),%eax
  101af5:	83 ec 08             	sub    $0x8,%esp
  101af8:	50                   	push   %eax
  101af9:	68 fc 37 10 00       	push   $0x1037fc
  101afe:	e8 2f e7 ff ff       	call   100232 <cprintf>
  101b03:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b06:	8b 45 08             	mov    0x8(%ebp),%eax
  101b09:	8b 40 04             	mov    0x4(%eax),%eax
  101b0c:	83 ec 08             	sub    $0x8,%esp
  101b0f:	50                   	push   %eax
  101b10:	68 0b 38 10 00       	push   $0x10380b
  101b15:	e8 18 e7 ff ff       	call   100232 <cprintf>
  101b1a:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b20:	8b 40 08             	mov    0x8(%eax),%eax
  101b23:	83 ec 08             	sub    $0x8,%esp
  101b26:	50                   	push   %eax
  101b27:	68 1a 38 10 00       	push   $0x10381a
  101b2c:	e8 01 e7 ff ff       	call   100232 <cprintf>
  101b31:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101b34:	8b 45 08             	mov    0x8(%ebp),%eax
  101b37:	8b 40 0c             	mov    0xc(%eax),%eax
  101b3a:	83 ec 08             	sub    $0x8,%esp
  101b3d:	50                   	push   %eax
  101b3e:	68 29 38 10 00       	push   $0x103829
  101b43:	e8 ea e6 ff ff       	call   100232 <cprintf>
  101b48:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101b4b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4e:	8b 40 10             	mov    0x10(%eax),%eax
  101b51:	83 ec 08             	sub    $0x8,%esp
  101b54:	50                   	push   %eax
  101b55:	68 38 38 10 00       	push   $0x103838
  101b5a:	e8 d3 e6 ff ff       	call   100232 <cprintf>
  101b5f:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101b62:	8b 45 08             	mov    0x8(%ebp),%eax
  101b65:	8b 40 14             	mov    0x14(%eax),%eax
  101b68:	83 ec 08             	sub    $0x8,%esp
  101b6b:	50                   	push   %eax
  101b6c:	68 47 38 10 00       	push   $0x103847
  101b71:	e8 bc e6 ff ff       	call   100232 <cprintf>
  101b76:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101b79:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7c:	8b 40 18             	mov    0x18(%eax),%eax
  101b7f:	83 ec 08             	sub    $0x8,%esp
  101b82:	50                   	push   %eax
  101b83:	68 56 38 10 00       	push   $0x103856
  101b88:	e8 a5 e6 ff ff       	call   100232 <cprintf>
  101b8d:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101b90:	8b 45 08             	mov    0x8(%ebp),%eax
  101b93:	8b 40 1c             	mov    0x1c(%eax),%eax
  101b96:	83 ec 08             	sub    $0x8,%esp
  101b99:	50                   	push   %eax
  101b9a:	68 65 38 10 00       	push   $0x103865
  101b9f:	e8 8e e6 ff ff       	call   100232 <cprintf>
  101ba4:	83 c4 10             	add    $0x10,%esp
}
  101ba7:	90                   	nop
  101ba8:	c9                   	leave  
  101ba9:	c3                   	ret    

00101baa <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101baa:	55                   	push   %ebp
  101bab:	89 e5                	mov    %esp,%ebp
  101bad:	83 ec 18             	sub    $0x18,%esp
    char c;
    static int cnts;

    switch (tf->tf_trapno) {
  101bb0:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb3:	8b 40 30             	mov    0x30(%eax),%eax
  101bb6:	83 f8 2f             	cmp    $0x2f,%eax
  101bb9:	77 21                	ja     101bdc <trap_dispatch+0x32>
  101bbb:	83 f8 2e             	cmp    $0x2e,%eax
  101bbe:	0f 83 eb 00 00 00    	jae    101caf <trap_dispatch+0x105>
  101bc4:	83 f8 21             	cmp    $0x21,%eax
  101bc7:	0f 84 88 00 00 00    	je     101c55 <trap_dispatch+0xab>
  101bcd:	83 f8 24             	cmp    $0x24,%eax
  101bd0:	74 5f                	je     101c31 <trap_dispatch+0x87>
  101bd2:	83 f8 20             	cmp    $0x20,%eax
  101bd5:	74 16                	je     101bed <trap_dispatch+0x43>
  101bd7:	e9 9d 00 00 00       	jmp    101c79 <trap_dispatch+0xcf>
  101bdc:	83 e8 78             	sub    $0x78,%eax
  101bdf:	83 f8 01             	cmp    $0x1,%eax
  101be2:	0f 87 91 00 00 00    	ja     101c79 <trap_dispatch+0xcf>
        break;
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        //panic("T_SWITCH_** ??\n");
        break;
  101be8:	e9 c3 00 00 00       	jmp    101cb0 <trap_dispatch+0x106>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        if (cnts % TICK_NUM == 0)
  101bed:	8b 0d a0 f8 10 00    	mov    0x10f8a0,%ecx
  101bf3:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101bf8:	89 c8                	mov    %ecx,%eax
  101bfa:	f7 ea                	imul   %edx
  101bfc:	c1 fa 05             	sar    $0x5,%edx
  101bff:	89 c8                	mov    %ecx,%eax
  101c01:	c1 f8 1f             	sar    $0x1f,%eax
  101c04:	29 c2                	sub    %eax,%edx
  101c06:	89 d0                	mov    %edx,%eax
  101c08:	6b c0 64             	imul   $0x64,%eax,%eax
  101c0b:	29 c1                	sub    %eax,%ecx
  101c0d:	89 c8                	mov    %ecx,%eax
  101c0f:	85 c0                	test   %eax,%eax
  101c11:	75 0f                	jne    101c22 <trap_dispatch+0x78>
        {
            print_ticks();
  101c13:	e8 a0 fb ff ff       	call   1017b8 <print_ticks>
            cnts=0;
  101c18:	c7 05 a0 f8 10 00 00 	movl   $0x0,0x10f8a0
  101c1f:	00 00 00 
        }
        cnts++;
  101c22:	a1 a0 f8 10 00       	mov    0x10f8a0,%eax
  101c27:	83 c0 01             	add    $0x1,%eax
  101c2a:	a3 a0 f8 10 00       	mov    %eax,0x10f8a0
        break;
  101c2f:	eb 7f                	jmp    101cb0 <trap_dispatch+0x106>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c31:	e8 55 f9 ff ff       	call   10158b <cons_getc>
  101c36:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101c39:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c3d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c41:	83 ec 04             	sub    $0x4,%esp
  101c44:	52                   	push   %edx
  101c45:	50                   	push   %eax
  101c46:	68 74 38 10 00       	push   $0x103874
  101c4b:	e8 e2 e5 ff ff       	call   100232 <cprintf>
  101c50:	83 c4 10             	add    $0x10,%esp
        break;
  101c53:	eb 5b                	jmp    101cb0 <trap_dispatch+0x106>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101c55:	e8 31 f9 ff ff       	call   10158b <cons_getc>
  101c5a:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101c5d:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c61:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c65:	83 ec 04             	sub    $0x4,%esp
  101c68:	52                   	push   %edx
  101c69:	50                   	push   %eax
  101c6a:	68 86 38 10 00       	push   $0x103886
  101c6f:	e8 be e5 ff ff       	call   100232 <cprintf>
  101c74:	83 c4 10             	add    $0x10,%esp
        break;
  101c77:	eb 37                	jmp    101cb0 <trap_dispatch+0x106>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101c79:	8b 45 08             	mov    0x8(%ebp),%eax
  101c7c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101c80:	0f b7 c0             	movzwl %ax,%eax
  101c83:	83 e0 03             	and    $0x3,%eax
  101c86:	85 c0                	test   %eax,%eax
  101c88:	75 26                	jne    101cb0 <trap_dispatch+0x106>
            print_trapframe(tf);
  101c8a:	83 ec 0c             	sub    $0xc,%esp
  101c8d:	ff 75 08             	pushl  0x8(%ebp)
  101c90:	e8 78 fc ff ff       	call   10190d <print_trapframe>
  101c95:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101c98:	83 ec 04             	sub    $0x4,%esp
  101c9b:	68 95 38 10 00       	push   $0x103895
  101ca0:	68 ba 00 00 00       	push   $0xba
  101ca5:	68 b1 38 10 00       	push   $0x1038b1
  101caa:	e8 e9 e6 ff ff       	call   100398 <__panic>
        //panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101caf:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101cb0:	90                   	nop
  101cb1:	c9                   	leave  
  101cb2:	c3                   	ret    

00101cb3 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101cb3:	55                   	push   %ebp
  101cb4:	89 e5                	mov    %esp,%ebp
  101cb6:	83 ec 08             	sub    $0x8,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101cb9:	83 ec 0c             	sub    $0xc,%esp
  101cbc:	ff 75 08             	pushl  0x8(%ebp)
  101cbf:	e8 e6 fe ff ff       	call   101baa <trap_dispatch>
  101cc4:	83 c4 10             	add    $0x10,%esp
}
  101cc7:	90                   	nop
  101cc8:	c9                   	leave  
  101cc9:	c3                   	ret    

00101cca <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101cca:	6a 00                	push   $0x0
  pushl $0
  101ccc:	6a 00                	push   $0x0
  jmp __alltraps
  101cce:	e9 67 0a 00 00       	jmp    10273a <__alltraps>

00101cd3 <vector1>:
.globl vector1
vector1:
  pushl $0
  101cd3:	6a 00                	push   $0x0
  pushl $1
  101cd5:	6a 01                	push   $0x1
  jmp __alltraps
  101cd7:	e9 5e 0a 00 00       	jmp    10273a <__alltraps>

00101cdc <vector2>:
.globl vector2
vector2:
  pushl $0
  101cdc:	6a 00                	push   $0x0
  pushl $2
  101cde:	6a 02                	push   $0x2
  jmp __alltraps
  101ce0:	e9 55 0a 00 00       	jmp    10273a <__alltraps>

00101ce5 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ce5:	6a 00                	push   $0x0
  pushl $3
  101ce7:	6a 03                	push   $0x3
  jmp __alltraps
  101ce9:	e9 4c 0a 00 00       	jmp    10273a <__alltraps>

00101cee <vector4>:
.globl vector4
vector4:
  pushl $0
  101cee:	6a 00                	push   $0x0
  pushl $4
  101cf0:	6a 04                	push   $0x4
  jmp __alltraps
  101cf2:	e9 43 0a 00 00       	jmp    10273a <__alltraps>

00101cf7 <vector5>:
.globl vector5
vector5:
  pushl $0
  101cf7:	6a 00                	push   $0x0
  pushl $5
  101cf9:	6a 05                	push   $0x5
  jmp __alltraps
  101cfb:	e9 3a 0a 00 00       	jmp    10273a <__alltraps>

00101d00 <vector6>:
.globl vector6
vector6:
  pushl $0
  101d00:	6a 00                	push   $0x0
  pushl $6
  101d02:	6a 06                	push   $0x6
  jmp __alltraps
  101d04:	e9 31 0a 00 00       	jmp    10273a <__alltraps>

00101d09 <vector7>:
.globl vector7
vector7:
  pushl $0
  101d09:	6a 00                	push   $0x0
  pushl $7
  101d0b:	6a 07                	push   $0x7
  jmp __alltraps
  101d0d:	e9 28 0a 00 00       	jmp    10273a <__alltraps>

00101d12 <vector8>:
.globl vector8
vector8:
  pushl $8
  101d12:	6a 08                	push   $0x8
  jmp __alltraps
  101d14:	e9 21 0a 00 00       	jmp    10273a <__alltraps>

00101d19 <vector9>:
.globl vector9
vector9:
  pushl $9
  101d19:	6a 09                	push   $0x9
  jmp __alltraps
  101d1b:	e9 1a 0a 00 00       	jmp    10273a <__alltraps>

00101d20 <vector10>:
.globl vector10
vector10:
  pushl $10
  101d20:	6a 0a                	push   $0xa
  jmp __alltraps
  101d22:	e9 13 0a 00 00       	jmp    10273a <__alltraps>

00101d27 <vector11>:
.globl vector11
vector11:
  pushl $11
  101d27:	6a 0b                	push   $0xb
  jmp __alltraps
  101d29:	e9 0c 0a 00 00       	jmp    10273a <__alltraps>

00101d2e <vector12>:
.globl vector12
vector12:
  pushl $12
  101d2e:	6a 0c                	push   $0xc
  jmp __alltraps
  101d30:	e9 05 0a 00 00       	jmp    10273a <__alltraps>

00101d35 <vector13>:
.globl vector13
vector13:
  pushl $13
  101d35:	6a 0d                	push   $0xd
  jmp __alltraps
  101d37:	e9 fe 09 00 00       	jmp    10273a <__alltraps>

00101d3c <vector14>:
.globl vector14
vector14:
  pushl $14
  101d3c:	6a 0e                	push   $0xe
  jmp __alltraps
  101d3e:	e9 f7 09 00 00       	jmp    10273a <__alltraps>

00101d43 <vector15>:
.globl vector15
vector15:
  pushl $0
  101d43:	6a 00                	push   $0x0
  pushl $15
  101d45:	6a 0f                	push   $0xf
  jmp __alltraps
  101d47:	e9 ee 09 00 00       	jmp    10273a <__alltraps>

00101d4c <vector16>:
.globl vector16
vector16:
  pushl $0
  101d4c:	6a 00                	push   $0x0
  pushl $16
  101d4e:	6a 10                	push   $0x10
  jmp __alltraps
  101d50:	e9 e5 09 00 00       	jmp    10273a <__alltraps>

00101d55 <vector17>:
.globl vector17
vector17:
  pushl $17
  101d55:	6a 11                	push   $0x11
  jmp __alltraps
  101d57:	e9 de 09 00 00       	jmp    10273a <__alltraps>

00101d5c <vector18>:
.globl vector18
vector18:
  pushl $0
  101d5c:	6a 00                	push   $0x0
  pushl $18
  101d5e:	6a 12                	push   $0x12
  jmp __alltraps
  101d60:	e9 d5 09 00 00       	jmp    10273a <__alltraps>

00101d65 <vector19>:
.globl vector19
vector19:
  pushl $0
  101d65:	6a 00                	push   $0x0
  pushl $19
  101d67:	6a 13                	push   $0x13
  jmp __alltraps
  101d69:	e9 cc 09 00 00       	jmp    10273a <__alltraps>

00101d6e <vector20>:
.globl vector20
vector20:
  pushl $0
  101d6e:	6a 00                	push   $0x0
  pushl $20
  101d70:	6a 14                	push   $0x14
  jmp __alltraps
  101d72:	e9 c3 09 00 00       	jmp    10273a <__alltraps>

00101d77 <vector21>:
.globl vector21
vector21:
  pushl $0
  101d77:	6a 00                	push   $0x0
  pushl $21
  101d79:	6a 15                	push   $0x15
  jmp __alltraps
  101d7b:	e9 ba 09 00 00       	jmp    10273a <__alltraps>

00101d80 <vector22>:
.globl vector22
vector22:
  pushl $0
  101d80:	6a 00                	push   $0x0
  pushl $22
  101d82:	6a 16                	push   $0x16
  jmp __alltraps
  101d84:	e9 b1 09 00 00       	jmp    10273a <__alltraps>

00101d89 <vector23>:
.globl vector23
vector23:
  pushl $0
  101d89:	6a 00                	push   $0x0
  pushl $23
  101d8b:	6a 17                	push   $0x17
  jmp __alltraps
  101d8d:	e9 a8 09 00 00       	jmp    10273a <__alltraps>

00101d92 <vector24>:
.globl vector24
vector24:
  pushl $0
  101d92:	6a 00                	push   $0x0
  pushl $24
  101d94:	6a 18                	push   $0x18
  jmp __alltraps
  101d96:	e9 9f 09 00 00       	jmp    10273a <__alltraps>

00101d9b <vector25>:
.globl vector25
vector25:
  pushl $0
  101d9b:	6a 00                	push   $0x0
  pushl $25
  101d9d:	6a 19                	push   $0x19
  jmp __alltraps
  101d9f:	e9 96 09 00 00       	jmp    10273a <__alltraps>

00101da4 <vector26>:
.globl vector26
vector26:
  pushl $0
  101da4:	6a 00                	push   $0x0
  pushl $26
  101da6:	6a 1a                	push   $0x1a
  jmp __alltraps
  101da8:	e9 8d 09 00 00       	jmp    10273a <__alltraps>

00101dad <vector27>:
.globl vector27
vector27:
  pushl $0
  101dad:	6a 00                	push   $0x0
  pushl $27
  101daf:	6a 1b                	push   $0x1b
  jmp __alltraps
  101db1:	e9 84 09 00 00       	jmp    10273a <__alltraps>

00101db6 <vector28>:
.globl vector28
vector28:
  pushl $0
  101db6:	6a 00                	push   $0x0
  pushl $28
  101db8:	6a 1c                	push   $0x1c
  jmp __alltraps
  101dba:	e9 7b 09 00 00       	jmp    10273a <__alltraps>

00101dbf <vector29>:
.globl vector29
vector29:
  pushl $0
  101dbf:	6a 00                	push   $0x0
  pushl $29
  101dc1:	6a 1d                	push   $0x1d
  jmp __alltraps
  101dc3:	e9 72 09 00 00       	jmp    10273a <__alltraps>

00101dc8 <vector30>:
.globl vector30
vector30:
  pushl $0
  101dc8:	6a 00                	push   $0x0
  pushl $30
  101dca:	6a 1e                	push   $0x1e
  jmp __alltraps
  101dcc:	e9 69 09 00 00       	jmp    10273a <__alltraps>

00101dd1 <vector31>:
.globl vector31
vector31:
  pushl $0
  101dd1:	6a 00                	push   $0x0
  pushl $31
  101dd3:	6a 1f                	push   $0x1f
  jmp __alltraps
  101dd5:	e9 60 09 00 00       	jmp    10273a <__alltraps>

00101dda <vector32>:
.globl vector32
vector32:
  pushl $0
  101dda:	6a 00                	push   $0x0
  pushl $32
  101ddc:	6a 20                	push   $0x20
  jmp __alltraps
  101dde:	e9 57 09 00 00       	jmp    10273a <__alltraps>

00101de3 <vector33>:
.globl vector33
vector33:
  pushl $0
  101de3:	6a 00                	push   $0x0
  pushl $33
  101de5:	6a 21                	push   $0x21
  jmp __alltraps
  101de7:	e9 4e 09 00 00       	jmp    10273a <__alltraps>

00101dec <vector34>:
.globl vector34
vector34:
  pushl $0
  101dec:	6a 00                	push   $0x0
  pushl $34
  101dee:	6a 22                	push   $0x22
  jmp __alltraps
  101df0:	e9 45 09 00 00       	jmp    10273a <__alltraps>

00101df5 <vector35>:
.globl vector35
vector35:
  pushl $0
  101df5:	6a 00                	push   $0x0
  pushl $35
  101df7:	6a 23                	push   $0x23
  jmp __alltraps
  101df9:	e9 3c 09 00 00       	jmp    10273a <__alltraps>

00101dfe <vector36>:
.globl vector36
vector36:
  pushl $0
  101dfe:	6a 00                	push   $0x0
  pushl $36
  101e00:	6a 24                	push   $0x24
  jmp __alltraps
  101e02:	e9 33 09 00 00       	jmp    10273a <__alltraps>

00101e07 <vector37>:
.globl vector37
vector37:
  pushl $0
  101e07:	6a 00                	push   $0x0
  pushl $37
  101e09:	6a 25                	push   $0x25
  jmp __alltraps
  101e0b:	e9 2a 09 00 00       	jmp    10273a <__alltraps>

00101e10 <vector38>:
.globl vector38
vector38:
  pushl $0
  101e10:	6a 00                	push   $0x0
  pushl $38
  101e12:	6a 26                	push   $0x26
  jmp __alltraps
  101e14:	e9 21 09 00 00       	jmp    10273a <__alltraps>

00101e19 <vector39>:
.globl vector39
vector39:
  pushl $0
  101e19:	6a 00                	push   $0x0
  pushl $39
  101e1b:	6a 27                	push   $0x27
  jmp __alltraps
  101e1d:	e9 18 09 00 00       	jmp    10273a <__alltraps>

00101e22 <vector40>:
.globl vector40
vector40:
  pushl $0
  101e22:	6a 00                	push   $0x0
  pushl $40
  101e24:	6a 28                	push   $0x28
  jmp __alltraps
  101e26:	e9 0f 09 00 00       	jmp    10273a <__alltraps>

00101e2b <vector41>:
.globl vector41
vector41:
  pushl $0
  101e2b:	6a 00                	push   $0x0
  pushl $41
  101e2d:	6a 29                	push   $0x29
  jmp __alltraps
  101e2f:	e9 06 09 00 00       	jmp    10273a <__alltraps>

00101e34 <vector42>:
.globl vector42
vector42:
  pushl $0
  101e34:	6a 00                	push   $0x0
  pushl $42
  101e36:	6a 2a                	push   $0x2a
  jmp __alltraps
  101e38:	e9 fd 08 00 00       	jmp    10273a <__alltraps>

00101e3d <vector43>:
.globl vector43
vector43:
  pushl $0
  101e3d:	6a 00                	push   $0x0
  pushl $43
  101e3f:	6a 2b                	push   $0x2b
  jmp __alltraps
  101e41:	e9 f4 08 00 00       	jmp    10273a <__alltraps>

00101e46 <vector44>:
.globl vector44
vector44:
  pushl $0
  101e46:	6a 00                	push   $0x0
  pushl $44
  101e48:	6a 2c                	push   $0x2c
  jmp __alltraps
  101e4a:	e9 eb 08 00 00       	jmp    10273a <__alltraps>

00101e4f <vector45>:
.globl vector45
vector45:
  pushl $0
  101e4f:	6a 00                	push   $0x0
  pushl $45
  101e51:	6a 2d                	push   $0x2d
  jmp __alltraps
  101e53:	e9 e2 08 00 00       	jmp    10273a <__alltraps>

00101e58 <vector46>:
.globl vector46
vector46:
  pushl $0
  101e58:	6a 00                	push   $0x0
  pushl $46
  101e5a:	6a 2e                	push   $0x2e
  jmp __alltraps
  101e5c:	e9 d9 08 00 00       	jmp    10273a <__alltraps>

00101e61 <vector47>:
.globl vector47
vector47:
  pushl $0
  101e61:	6a 00                	push   $0x0
  pushl $47
  101e63:	6a 2f                	push   $0x2f
  jmp __alltraps
  101e65:	e9 d0 08 00 00       	jmp    10273a <__alltraps>

00101e6a <vector48>:
.globl vector48
vector48:
  pushl $0
  101e6a:	6a 00                	push   $0x0
  pushl $48
  101e6c:	6a 30                	push   $0x30
  jmp __alltraps
  101e6e:	e9 c7 08 00 00       	jmp    10273a <__alltraps>

00101e73 <vector49>:
.globl vector49
vector49:
  pushl $0
  101e73:	6a 00                	push   $0x0
  pushl $49
  101e75:	6a 31                	push   $0x31
  jmp __alltraps
  101e77:	e9 be 08 00 00       	jmp    10273a <__alltraps>

00101e7c <vector50>:
.globl vector50
vector50:
  pushl $0
  101e7c:	6a 00                	push   $0x0
  pushl $50
  101e7e:	6a 32                	push   $0x32
  jmp __alltraps
  101e80:	e9 b5 08 00 00       	jmp    10273a <__alltraps>

00101e85 <vector51>:
.globl vector51
vector51:
  pushl $0
  101e85:	6a 00                	push   $0x0
  pushl $51
  101e87:	6a 33                	push   $0x33
  jmp __alltraps
  101e89:	e9 ac 08 00 00       	jmp    10273a <__alltraps>

00101e8e <vector52>:
.globl vector52
vector52:
  pushl $0
  101e8e:	6a 00                	push   $0x0
  pushl $52
  101e90:	6a 34                	push   $0x34
  jmp __alltraps
  101e92:	e9 a3 08 00 00       	jmp    10273a <__alltraps>

00101e97 <vector53>:
.globl vector53
vector53:
  pushl $0
  101e97:	6a 00                	push   $0x0
  pushl $53
  101e99:	6a 35                	push   $0x35
  jmp __alltraps
  101e9b:	e9 9a 08 00 00       	jmp    10273a <__alltraps>

00101ea0 <vector54>:
.globl vector54
vector54:
  pushl $0
  101ea0:	6a 00                	push   $0x0
  pushl $54
  101ea2:	6a 36                	push   $0x36
  jmp __alltraps
  101ea4:	e9 91 08 00 00       	jmp    10273a <__alltraps>

00101ea9 <vector55>:
.globl vector55
vector55:
  pushl $0
  101ea9:	6a 00                	push   $0x0
  pushl $55
  101eab:	6a 37                	push   $0x37
  jmp __alltraps
  101ead:	e9 88 08 00 00       	jmp    10273a <__alltraps>

00101eb2 <vector56>:
.globl vector56
vector56:
  pushl $0
  101eb2:	6a 00                	push   $0x0
  pushl $56
  101eb4:	6a 38                	push   $0x38
  jmp __alltraps
  101eb6:	e9 7f 08 00 00       	jmp    10273a <__alltraps>

00101ebb <vector57>:
.globl vector57
vector57:
  pushl $0
  101ebb:	6a 00                	push   $0x0
  pushl $57
  101ebd:	6a 39                	push   $0x39
  jmp __alltraps
  101ebf:	e9 76 08 00 00       	jmp    10273a <__alltraps>

00101ec4 <vector58>:
.globl vector58
vector58:
  pushl $0
  101ec4:	6a 00                	push   $0x0
  pushl $58
  101ec6:	6a 3a                	push   $0x3a
  jmp __alltraps
  101ec8:	e9 6d 08 00 00       	jmp    10273a <__alltraps>

00101ecd <vector59>:
.globl vector59
vector59:
  pushl $0
  101ecd:	6a 00                	push   $0x0
  pushl $59
  101ecf:	6a 3b                	push   $0x3b
  jmp __alltraps
  101ed1:	e9 64 08 00 00       	jmp    10273a <__alltraps>

00101ed6 <vector60>:
.globl vector60
vector60:
  pushl $0
  101ed6:	6a 00                	push   $0x0
  pushl $60
  101ed8:	6a 3c                	push   $0x3c
  jmp __alltraps
  101eda:	e9 5b 08 00 00       	jmp    10273a <__alltraps>

00101edf <vector61>:
.globl vector61
vector61:
  pushl $0
  101edf:	6a 00                	push   $0x0
  pushl $61
  101ee1:	6a 3d                	push   $0x3d
  jmp __alltraps
  101ee3:	e9 52 08 00 00       	jmp    10273a <__alltraps>

00101ee8 <vector62>:
.globl vector62
vector62:
  pushl $0
  101ee8:	6a 00                	push   $0x0
  pushl $62
  101eea:	6a 3e                	push   $0x3e
  jmp __alltraps
  101eec:	e9 49 08 00 00       	jmp    10273a <__alltraps>

00101ef1 <vector63>:
.globl vector63
vector63:
  pushl $0
  101ef1:	6a 00                	push   $0x0
  pushl $63
  101ef3:	6a 3f                	push   $0x3f
  jmp __alltraps
  101ef5:	e9 40 08 00 00       	jmp    10273a <__alltraps>

00101efa <vector64>:
.globl vector64
vector64:
  pushl $0
  101efa:	6a 00                	push   $0x0
  pushl $64
  101efc:	6a 40                	push   $0x40
  jmp __alltraps
  101efe:	e9 37 08 00 00       	jmp    10273a <__alltraps>

00101f03 <vector65>:
.globl vector65
vector65:
  pushl $0
  101f03:	6a 00                	push   $0x0
  pushl $65
  101f05:	6a 41                	push   $0x41
  jmp __alltraps
  101f07:	e9 2e 08 00 00       	jmp    10273a <__alltraps>

00101f0c <vector66>:
.globl vector66
vector66:
  pushl $0
  101f0c:	6a 00                	push   $0x0
  pushl $66
  101f0e:	6a 42                	push   $0x42
  jmp __alltraps
  101f10:	e9 25 08 00 00       	jmp    10273a <__alltraps>

00101f15 <vector67>:
.globl vector67
vector67:
  pushl $0
  101f15:	6a 00                	push   $0x0
  pushl $67
  101f17:	6a 43                	push   $0x43
  jmp __alltraps
  101f19:	e9 1c 08 00 00       	jmp    10273a <__alltraps>

00101f1e <vector68>:
.globl vector68
vector68:
  pushl $0
  101f1e:	6a 00                	push   $0x0
  pushl $68
  101f20:	6a 44                	push   $0x44
  jmp __alltraps
  101f22:	e9 13 08 00 00       	jmp    10273a <__alltraps>

00101f27 <vector69>:
.globl vector69
vector69:
  pushl $0
  101f27:	6a 00                	push   $0x0
  pushl $69
  101f29:	6a 45                	push   $0x45
  jmp __alltraps
  101f2b:	e9 0a 08 00 00       	jmp    10273a <__alltraps>

00101f30 <vector70>:
.globl vector70
vector70:
  pushl $0
  101f30:	6a 00                	push   $0x0
  pushl $70
  101f32:	6a 46                	push   $0x46
  jmp __alltraps
  101f34:	e9 01 08 00 00       	jmp    10273a <__alltraps>

00101f39 <vector71>:
.globl vector71
vector71:
  pushl $0
  101f39:	6a 00                	push   $0x0
  pushl $71
  101f3b:	6a 47                	push   $0x47
  jmp __alltraps
  101f3d:	e9 f8 07 00 00       	jmp    10273a <__alltraps>

00101f42 <vector72>:
.globl vector72
vector72:
  pushl $0
  101f42:	6a 00                	push   $0x0
  pushl $72
  101f44:	6a 48                	push   $0x48
  jmp __alltraps
  101f46:	e9 ef 07 00 00       	jmp    10273a <__alltraps>

00101f4b <vector73>:
.globl vector73
vector73:
  pushl $0
  101f4b:	6a 00                	push   $0x0
  pushl $73
  101f4d:	6a 49                	push   $0x49
  jmp __alltraps
  101f4f:	e9 e6 07 00 00       	jmp    10273a <__alltraps>

00101f54 <vector74>:
.globl vector74
vector74:
  pushl $0
  101f54:	6a 00                	push   $0x0
  pushl $74
  101f56:	6a 4a                	push   $0x4a
  jmp __alltraps
  101f58:	e9 dd 07 00 00       	jmp    10273a <__alltraps>

00101f5d <vector75>:
.globl vector75
vector75:
  pushl $0
  101f5d:	6a 00                	push   $0x0
  pushl $75
  101f5f:	6a 4b                	push   $0x4b
  jmp __alltraps
  101f61:	e9 d4 07 00 00       	jmp    10273a <__alltraps>

00101f66 <vector76>:
.globl vector76
vector76:
  pushl $0
  101f66:	6a 00                	push   $0x0
  pushl $76
  101f68:	6a 4c                	push   $0x4c
  jmp __alltraps
  101f6a:	e9 cb 07 00 00       	jmp    10273a <__alltraps>

00101f6f <vector77>:
.globl vector77
vector77:
  pushl $0
  101f6f:	6a 00                	push   $0x0
  pushl $77
  101f71:	6a 4d                	push   $0x4d
  jmp __alltraps
  101f73:	e9 c2 07 00 00       	jmp    10273a <__alltraps>

00101f78 <vector78>:
.globl vector78
vector78:
  pushl $0
  101f78:	6a 00                	push   $0x0
  pushl $78
  101f7a:	6a 4e                	push   $0x4e
  jmp __alltraps
  101f7c:	e9 b9 07 00 00       	jmp    10273a <__alltraps>

00101f81 <vector79>:
.globl vector79
vector79:
  pushl $0
  101f81:	6a 00                	push   $0x0
  pushl $79
  101f83:	6a 4f                	push   $0x4f
  jmp __alltraps
  101f85:	e9 b0 07 00 00       	jmp    10273a <__alltraps>

00101f8a <vector80>:
.globl vector80
vector80:
  pushl $0
  101f8a:	6a 00                	push   $0x0
  pushl $80
  101f8c:	6a 50                	push   $0x50
  jmp __alltraps
  101f8e:	e9 a7 07 00 00       	jmp    10273a <__alltraps>

00101f93 <vector81>:
.globl vector81
vector81:
  pushl $0
  101f93:	6a 00                	push   $0x0
  pushl $81
  101f95:	6a 51                	push   $0x51
  jmp __alltraps
  101f97:	e9 9e 07 00 00       	jmp    10273a <__alltraps>

00101f9c <vector82>:
.globl vector82
vector82:
  pushl $0
  101f9c:	6a 00                	push   $0x0
  pushl $82
  101f9e:	6a 52                	push   $0x52
  jmp __alltraps
  101fa0:	e9 95 07 00 00       	jmp    10273a <__alltraps>

00101fa5 <vector83>:
.globl vector83
vector83:
  pushl $0
  101fa5:	6a 00                	push   $0x0
  pushl $83
  101fa7:	6a 53                	push   $0x53
  jmp __alltraps
  101fa9:	e9 8c 07 00 00       	jmp    10273a <__alltraps>

00101fae <vector84>:
.globl vector84
vector84:
  pushl $0
  101fae:	6a 00                	push   $0x0
  pushl $84
  101fb0:	6a 54                	push   $0x54
  jmp __alltraps
  101fb2:	e9 83 07 00 00       	jmp    10273a <__alltraps>

00101fb7 <vector85>:
.globl vector85
vector85:
  pushl $0
  101fb7:	6a 00                	push   $0x0
  pushl $85
  101fb9:	6a 55                	push   $0x55
  jmp __alltraps
  101fbb:	e9 7a 07 00 00       	jmp    10273a <__alltraps>

00101fc0 <vector86>:
.globl vector86
vector86:
  pushl $0
  101fc0:	6a 00                	push   $0x0
  pushl $86
  101fc2:	6a 56                	push   $0x56
  jmp __alltraps
  101fc4:	e9 71 07 00 00       	jmp    10273a <__alltraps>

00101fc9 <vector87>:
.globl vector87
vector87:
  pushl $0
  101fc9:	6a 00                	push   $0x0
  pushl $87
  101fcb:	6a 57                	push   $0x57
  jmp __alltraps
  101fcd:	e9 68 07 00 00       	jmp    10273a <__alltraps>

00101fd2 <vector88>:
.globl vector88
vector88:
  pushl $0
  101fd2:	6a 00                	push   $0x0
  pushl $88
  101fd4:	6a 58                	push   $0x58
  jmp __alltraps
  101fd6:	e9 5f 07 00 00       	jmp    10273a <__alltraps>

00101fdb <vector89>:
.globl vector89
vector89:
  pushl $0
  101fdb:	6a 00                	push   $0x0
  pushl $89
  101fdd:	6a 59                	push   $0x59
  jmp __alltraps
  101fdf:	e9 56 07 00 00       	jmp    10273a <__alltraps>

00101fe4 <vector90>:
.globl vector90
vector90:
  pushl $0
  101fe4:	6a 00                	push   $0x0
  pushl $90
  101fe6:	6a 5a                	push   $0x5a
  jmp __alltraps
  101fe8:	e9 4d 07 00 00       	jmp    10273a <__alltraps>

00101fed <vector91>:
.globl vector91
vector91:
  pushl $0
  101fed:	6a 00                	push   $0x0
  pushl $91
  101fef:	6a 5b                	push   $0x5b
  jmp __alltraps
  101ff1:	e9 44 07 00 00       	jmp    10273a <__alltraps>

00101ff6 <vector92>:
.globl vector92
vector92:
  pushl $0
  101ff6:	6a 00                	push   $0x0
  pushl $92
  101ff8:	6a 5c                	push   $0x5c
  jmp __alltraps
  101ffa:	e9 3b 07 00 00       	jmp    10273a <__alltraps>

00101fff <vector93>:
.globl vector93
vector93:
  pushl $0
  101fff:	6a 00                	push   $0x0
  pushl $93
  102001:	6a 5d                	push   $0x5d
  jmp __alltraps
  102003:	e9 32 07 00 00       	jmp    10273a <__alltraps>

00102008 <vector94>:
.globl vector94
vector94:
  pushl $0
  102008:	6a 00                	push   $0x0
  pushl $94
  10200a:	6a 5e                	push   $0x5e
  jmp __alltraps
  10200c:	e9 29 07 00 00       	jmp    10273a <__alltraps>

00102011 <vector95>:
.globl vector95
vector95:
  pushl $0
  102011:	6a 00                	push   $0x0
  pushl $95
  102013:	6a 5f                	push   $0x5f
  jmp __alltraps
  102015:	e9 20 07 00 00       	jmp    10273a <__alltraps>

0010201a <vector96>:
.globl vector96
vector96:
  pushl $0
  10201a:	6a 00                	push   $0x0
  pushl $96
  10201c:	6a 60                	push   $0x60
  jmp __alltraps
  10201e:	e9 17 07 00 00       	jmp    10273a <__alltraps>

00102023 <vector97>:
.globl vector97
vector97:
  pushl $0
  102023:	6a 00                	push   $0x0
  pushl $97
  102025:	6a 61                	push   $0x61
  jmp __alltraps
  102027:	e9 0e 07 00 00       	jmp    10273a <__alltraps>

0010202c <vector98>:
.globl vector98
vector98:
  pushl $0
  10202c:	6a 00                	push   $0x0
  pushl $98
  10202e:	6a 62                	push   $0x62
  jmp __alltraps
  102030:	e9 05 07 00 00       	jmp    10273a <__alltraps>

00102035 <vector99>:
.globl vector99
vector99:
  pushl $0
  102035:	6a 00                	push   $0x0
  pushl $99
  102037:	6a 63                	push   $0x63
  jmp __alltraps
  102039:	e9 fc 06 00 00       	jmp    10273a <__alltraps>

0010203e <vector100>:
.globl vector100
vector100:
  pushl $0
  10203e:	6a 00                	push   $0x0
  pushl $100
  102040:	6a 64                	push   $0x64
  jmp __alltraps
  102042:	e9 f3 06 00 00       	jmp    10273a <__alltraps>

00102047 <vector101>:
.globl vector101
vector101:
  pushl $0
  102047:	6a 00                	push   $0x0
  pushl $101
  102049:	6a 65                	push   $0x65
  jmp __alltraps
  10204b:	e9 ea 06 00 00       	jmp    10273a <__alltraps>

00102050 <vector102>:
.globl vector102
vector102:
  pushl $0
  102050:	6a 00                	push   $0x0
  pushl $102
  102052:	6a 66                	push   $0x66
  jmp __alltraps
  102054:	e9 e1 06 00 00       	jmp    10273a <__alltraps>

00102059 <vector103>:
.globl vector103
vector103:
  pushl $0
  102059:	6a 00                	push   $0x0
  pushl $103
  10205b:	6a 67                	push   $0x67
  jmp __alltraps
  10205d:	e9 d8 06 00 00       	jmp    10273a <__alltraps>

00102062 <vector104>:
.globl vector104
vector104:
  pushl $0
  102062:	6a 00                	push   $0x0
  pushl $104
  102064:	6a 68                	push   $0x68
  jmp __alltraps
  102066:	e9 cf 06 00 00       	jmp    10273a <__alltraps>

0010206b <vector105>:
.globl vector105
vector105:
  pushl $0
  10206b:	6a 00                	push   $0x0
  pushl $105
  10206d:	6a 69                	push   $0x69
  jmp __alltraps
  10206f:	e9 c6 06 00 00       	jmp    10273a <__alltraps>

00102074 <vector106>:
.globl vector106
vector106:
  pushl $0
  102074:	6a 00                	push   $0x0
  pushl $106
  102076:	6a 6a                	push   $0x6a
  jmp __alltraps
  102078:	e9 bd 06 00 00       	jmp    10273a <__alltraps>

0010207d <vector107>:
.globl vector107
vector107:
  pushl $0
  10207d:	6a 00                	push   $0x0
  pushl $107
  10207f:	6a 6b                	push   $0x6b
  jmp __alltraps
  102081:	e9 b4 06 00 00       	jmp    10273a <__alltraps>

00102086 <vector108>:
.globl vector108
vector108:
  pushl $0
  102086:	6a 00                	push   $0x0
  pushl $108
  102088:	6a 6c                	push   $0x6c
  jmp __alltraps
  10208a:	e9 ab 06 00 00       	jmp    10273a <__alltraps>

0010208f <vector109>:
.globl vector109
vector109:
  pushl $0
  10208f:	6a 00                	push   $0x0
  pushl $109
  102091:	6a 6d                	push   $0x6d
  jmp __alltraps
  102093:	e9 a2 06 00 00       	jmp    10273a <__alltraps>

00102098 <vector110>:
.globl vector110
vector110:
  pushl $0
  102098:	6a 00                	push   $0x0
  pushl $110
  10209a:	6a 6e                	push   $0x6e
  jmp __alltraps
  10209c:	e9 99 06 00 00       	jmp    10273a <__alltraps>

001020a1 <vector111>:
.globl vector111
vector111:
  pushl $0
  1020a1:	6a 00                	push   $0x0
  pushl $111
  1020a3:	6a 6f                	push   $0x6f
  jmp __alltraps
  1020a5:	e9 90 06 00 00       	jmp    10273a <__alltraps>

001020aa <vector112>:
.globl vector112
vector112:
  pushl $0
  1020aa:	6a 00                	push   $0x0
  pushl $112
  1020ac:	6a 70                	push   $0x70
  jmp __alltraps
  1020ae:	e9 87 06 00 00       	jmp    10273a <__alltraps>

001020b3 <vector113>:
.globl vector113
vector113:
  pushl $0
  1020b3:	6a 00                	push   $0x0
  pushl $113
  1020b5:	6a 71                	push   $0x71
  jmp __alltraps
  1020b7:	e9 7e 06 00 00       	jmp    10273a <__alltraps>

001020bc <vector114>:
.globl vector114
vector114:
  pushl $0
  1020bc:	6a 00                	push   $0x0
  pushl $114
  1020be:	6a 72                	push   $0x72
  jmp __alltraps
  1020c0:	e9 75 06 00 00       	jmp    10273a <__alltraps>

001020c5 <vector115>:
.globl vector115
vector115:
  pushl $0
  1020c5:	6a 00                	push   $0x0
  pushl $115
  1020c7:	6a 73                	push   $0x73
  jmp __alltraps
  1020c9:	e9 6c 06 00 00       	jmp    10273a <__alltraps>

001020ce <vector116>:
.globl vector116
vector116:
  pushl $0
  1020ce:	6a 00                	push   $0x0
  pushl $116
  1020d0:	6a 74                	push   $0x74
  jmp __alltraps
  1020d2:	e9 63 06 00 00       	jmp    10273a <__alltraps>

001020d7 <vector117>:
.globl vector117
vector117:
  pushl $0
  1020d7:	6a 00                	push   $0x0
  pushl $117
  1020d9:	6a 75                	push   $0x75
  jmp __alltraps
  1020db:	e9 5a 06 00 00       	jmp    10273a <__alltraps>

001020e0 <vector118>:
.globl vector118
vector118:
  pushl $0
  1020e0:	6a 00                	push   $0x0
  pushl $118
  1020e2:	6a 76                	push   $0x76
  jmp __alltraps
  1020e4:	e9 51 06 00 00       	jmp    10273a <__alltraps>

001020e9 <vector119>:
.globl vector119
vector119:
  pushl $0
  1020e9:	6a 00                	push   $0x0
  pushl $119
  1020eb:	6a 77                	push   $0x77
  jmp __alltraps
  1020ed:	e9 48 06 00 00       	jmp    10273a <__alltraps>

001020f2 <vector120>:
.globl vector120
vector120:
  pushl $0
  1020f2:	6a 00                	push   $0x0
  pushl $120
  1020f4:	6a 78                	push   $0x78
  jmp __alltraps
  1020f6:	e9 3f 06 00 00       	jmp    10273a <__alltraps>

001020fb <vector121>:
.globl vector121
vector121:
  pushl $0
  1020fb:	6a 00                	push   $0x0
  pushl $121
  1020fd:	6a 79                	push   $0x79
  jmp __alltraps
  1020ff:	e9 36 06 00 00       	jmp    10273a <__alltraps>

00102104 <vector122>:
.globl vector122
vector122:
  pushl $0
  102104:	6a 00                	push   $0x0
  pushl $122
  102106:	6a 7a                	push   $0x7a
  jmp __alltraps
  102108:	e9 2d 06 00 00       	jmp    10273a <__alltraps>

0010210d <vector123>:
.globl vector123
vector123:
  pushl $0
  10210d:	6a 00                	push   $0x0
  pushl $123
  10210f:	6a 7b                	push   $0x7b
  jmp __alltraps
  102111:	e9 24 06 00 00       	jmp    10273a <__alltraps>

00102116 <vector124>:
.globl vector124
vector124:
  pushl $0
  102116:	6a 00                	push   $0x0
  pushl $124
  102118:	6a 7c                	push   $0x7c
  jmp __alltraps
  10211a:	e9 1b 06 00 00       	jmp    10273a <__alltraps>

0010211f <vector125>:
.globl vector125
vector125:
  pushl $0
  10211f:	6a 00                	push   $0x0
  pushl $125
  102121:	6a 7d                	push   $0x7d
  jmp __alltraps
  102123:	e9 12 06 00 00       	jmp    10273a <__alltraps>

00102128 <vector126>:
.globl vector126
vector126:
  pushl $0
  102128:	6a 00                	push   $0x0
  pushl $126
  10212a:	6a 7e                	push   $0x7e
  jmp __alltraps
  10212c:	e9 09 06 00 00       	jmp    10273a <__alltraps>

00102131 <vector127>:
.globl vector127
vector127:
  pushl $0
  102131:	6a 00                	push   $0x0
  pushl $127
  102133:	6a 7f                	push   $0x7f
  jmp __alltraps
  102135:	e9 00 06 00 00       	jmp    10273a <__alltraps>

0010213a <vector128>:
.globl vector128
vector128:
  pushl $0
  10213a:	6a 00                	push   $0x0
  pushl $128
  10213c:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102141:	e9 f4 05 00 00       	jmp    10273a <__alltraps>

00102146 <vector129>:
.globl vector129
vector129:
  pushl $0
  102146:	6a 00                	push   $0x0
  pushl $129
  102148:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10214d:	e9 e8 05 00 00       	jmp    10273a <__alltraps>

00102152 <vector130>:
.globl vector130
vector130:
  pushl $0
  102152:	6a 00                	push   $0x0
  pushl $130
  102154:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102159:	e9 dc 05 00 00       	jmp    10273a <__alltraps>

0010215e <vector131>:
.globl vector131
vector131:
  pushl $0
  10215e:	6a 00                	push   $0x0
  pushl $131
  102160:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102165:	e9 d0 05 00 00       	jmp    10273a <__alltraps>

0010216a <vector132>:
.globl vector132
vector132:
  pushl $0
  10216a:	6a 00                	push   $0x0
  pushl $132
  10216c:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102171:	e9 c4 05 00 00       	jmp    10273a <__alltraps>

00102176 <vector133>:
.globl vector133
vector133:
  pushl $0
  102176:	6a 00                	push   $0x0
  pushl $133
  102178:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10217d:	e9 b8 05 00 00       	jmp    10273a <__alltraps>

00102182 <vector134>:
.globl vector134
vector134:
  pushl $0
  102182:	6a 00                	push   $0x0
  pushl $134
  102184:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102189:	e9 ac 05 00 00       	jmp    10273a <__alltraps>

0010218e <vector135>:
.globl vector135
vector135:
  pushl $0
  10218e:	6a 00                	push   $0x0
  pushl $135
  102190:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102195:	e9 a0 05 00 00       	jmp    10273a <__alltraps>

0010219a <vector136>:
.globl vector136
vector136:
  pushl $0
  10219a:	6a 00                	push   $0x0
  pushl $136
  10219c:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1021a1:	e9 94 05 00 00       	jmp    10273a <__alltraps>

001021a6 <vector137>:
.globl vector137
vector137:
  pushl $0
  1021a6:	6a 00                	push   $0x0
  pushl $137
  1021a8:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1021ad:	e9 88 05 00 00       	jmp    10273a <__alltraps>

001021b2 <vector138>:
.globl vector138
vector138:
  pushl $0
  1021b2:	6a 00                	push   $0x0
  pushl $138
  1021b4:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1021b9:	e9 7c 05 00 00       	jmp    10273a <__alltraps>

001021be <vector139>:
.globl vector139
vector139:
  pushl $0
  1021be:	6a 00                	push   $0x0
  pushl $139
  1021c0:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1021c5:	e9 70 05 00 00       	jmp    10273a <__alltraps>

001021ca <vector140>:
.globl vector140
vector140:
  pushl $0
  1021ca:	6a 00                	push   $0x0
  pushl $140
  1021cc:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1021d1:	e9 64 05 00 00       	jmp    10273a <__alltraps>

001021d6 <vector141>:
.globl vector141
vector141:
  pushl $0
  1021d6:	6a 00                	push   $0x0
  pushl $141
  1021d8:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1021dd:	e9 58 05 00 00       	jmp    10273a <__alltraps>

001021e2 <vector142>:
.globl vector142
vector142:
  pushl $0
  1021e2:	6a 00                	push   $0x0
  pushl $142
  1021e4:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1021e9:	e9 4c 05 00 00       	jmp    10273a <__alltraps>

001021ee <vector143>:
.globl vector143
vector143:
  pushl $0
  1021ee:	6a 00                	push   $0x0
  pushl $143
  1021f0:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1021f5:	e9 40 05 00 00       	jmp    10273a <__alltraps>

001021fa <vector144>:
.globl vector144
vector144:
  pushl $0
  1021fa:	6a 00                	push   $0x0
  pushl $144
  1021fc:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102201:	e9 34 05 00 00       	jmp    10273a <__alltraps>

00102206 <vector145>:
.globl vector145
vector145:
  pushl $0
  102206:	6a 00                	push   $0x0
  pushl $145
  102208:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10220d:	e9 28 05 00 00       	jmp    10273a <__alltraps>

00102212 <vector146>:
.globl vector146
vector146:
  pushl $0
  102212:	6a 00                	push   $0x0
  pushl $146
  102214:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102219:	e9 1c 05 00 00       	jmp    10273a <__alltraps>

0010221e <vector147>:
.globl vector147
vector147:
  pushl $0
  10221e:	6a 00                	push   $0x0
  pushl $147
  102220:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102225:	e9 10 05 00 00       	jmp    10273a <__alltraps>

0010222a <vector148>:
.globl vector148
vector148:
  pushl $0
  10222a:	6a 00                	push   $0x0
  pushl $148
  10222c:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102231:	e9 04 05 00 00       	jmp    10273a <__alltraps>

00102236 <vector149>:
.globl vector149
vector149:
  pushl $0
  102236:	6a 00                	push   $0x0
  pushl $149
  102238:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10223d:	e9 f8 04 00 00       	jmp    10273a <__alltraps>

00102242 <vector150>:
.globl vector150
vector150:
  pushl $0
  102242:	6a 00                	push   $0x0
  pushl $150
  102244:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102249:	e9 ec 04 00 00       	jmp    10273a <__alltraps>

0010224e <vector151>:
.globl vector151
vector151:
  pushl $0
  10224e:	6a 00                	push   $0x0
  pushl $151
  102250:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102255:	e9 e0 04 00 00       	jmp    10273a <__alltraps>

0010225a <vector152>:
.globl vector152
vector152:
  pushl $0
  10225a:	6a 00                	push   $0x0
  pushl $152
  10225c:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102261:	e9 d4 04 00 00       	jmp    10273a <__alltraps>

00102266 <vector153>:
.globl vector153
vector153:
  pushl $0
  102266:	6a 00                	push   $0x0
  pushl $153
  102268:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10226d:	e9 c8 04 00 00       	jmp    10273a <__alltraps>

00102272 <vector154>:
.globl vector154
vector154:
  pushl $0
  102272:	6a 00                	push   $0x0
  pushl $154
  102274:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102279:	e9 bc 04 00 00       	jmp    10273a <__alltraps>

0010227e <vector155>:
.globl vector155
vector155:
  pushl $0
  10227e:	6a 00                	push   $0x0
  pushl $155
  102280:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102285:	e9 b0 04 00 00       	jmp    10273a <__alltraps>

0010228a <vector156>:
.globl vector156
vector156:
  pushl $0
  10228a:	6a 00                	push   $0x0
  pushl $156
  10228c:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102291:	e9 a4 04 00 00       	jmp    10273a <__alltraps>

00102296 <vector157>:
.globl vector157
vector157:
  pushl $0
  102296:	6a 00                	push   $0x0
  pushl $157
  102298:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10229d:	e9 98 04 00 00       	jmp    10273a <__alltraps>

001022a2 <vector158>:
.globl vector158
vector158:
  pushl $0
  1022a2:	6a 00                	push   $0x0
  pushl $158
  1022a4:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1022a9:	e9 8c 04 00 00       	jmp    10273a <__alltraps>

001022ae <vector159>:
.globl vector159
vector159:
  pushl $0
  1022ae:	6a 00                	push   $0x0
  pushl $159
  1022b0:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1022b5:	e9 80 04 00 00       	jmp    10273a <__alltraps>

001022ba <vector160>:
.globl vector160
vector160:
  pushl $0
  1022ba:	6a 00                	push   $0x0
  pushl $160
  1022bc:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1022c1:	e9 74 04 00 00       	jmp    10273a <__alltraps>

001022c6 <vector161>:
.globl vector161
vector161:
  pushl $0
  1022c6:	6a 00                	push   $0x0
  pushl $161
  1022c8:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1022cd:	e9 68 04 00 00       	jmp    10273a <__alltraps>

001022d2 <vector162>:
.globl vector162
vector162:
  pushl $0
  1022d2:	6a 00                	push   $0x0
  pushl $162
  1022d4:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1022d9:	e9 5c 04 00 00       	jmp    10273a <__alltraps>

001022de <vector163>:
.globl vector163
vector163:
  pushl $0
  1022de:	6a 00                	push   $0x0
  pushl $163
  1022e0:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1022e5:	e9 50 04 00 00       	jmp    10273a <__alltraps>

001022ea <vector164>:
.globl vector164
vector164:
  pushl $0
  1022ea:	6a 00                	push   $0x0
  pushl $164
  1022ec:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1022f1:	e9 44 04 00 00       	jmp    10273a <__alltraps>

001022f6 <vector165>:
.globl vector165
vector165:
  pushl $0
  1022f6:	6a 00                	push   $0x0
  pushl $165
  1022f8:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1022fd:	e9 38 04 00 00       	jmp    10273a <__alltraps>

00102302 <vector166>:
.globl vector166
vector166:
  pushl $0
  102302:	6a 00                	push   $0x0
  pushl $166
  102304:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102309:	e9 2c 04 00 00       	jmp    10273a <__alltraps>

0010230e <vector167>:
.globl vector167
vector167:
  pushl $0
  10230e:	6a 00                	push   $0x0
  pushl $167
  102310:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102315:	e9 20 04 00 00       	jmp    10273a <__alltraps>

0010231a <vector168>:
.globl vector168
vector168:
  pushl $0
  10231a:	6a 00                	push   $0x0
  pushl $168
  10231c:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102321:	e9 14 04 00 00       	jmp    10273a <__alltraps>

00102326 <vector169>:
.globl vector169
vector169:
  pushl $0
  102326:	6a 00                	push   $0x0
  pushl $169
  102328:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10232d:	e9 08 04 00 00       	jmp    10273a <__alltraps>

00102332 <vector170>:
.globl vector170
vector170:
  pushl $0
  102332:	6a 00                	push   $0x0
  pushl $170
  102334:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102339:	e9 fc 03 00 00       	jmp    10273a <__alltraps>

0010233e <vector171>:
.globl vector171
vector171:
  pushl $0
  10233e:	6a 00                	push   $0x0
  pushl $171
  102340:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102345:	e9 f0 03 00 00       	jmp    10273a <__alltraps>

0010234a <vector172>:
.globl vector172
vector172:
  pushl $0
  10234a:	6a 00                	push   $0x0
  pushl $172
  10234c:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102351:	e9 e4 03 00 00       	jmp    10273a <__alltraps>

00102356 <vector173>:
.globl vector173
vector173:
  pushl $0
  102356:	6a 00                	push   $0x0
  pushl $173
  102358:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10235d:	e9 d8 03 00 00       	jmp    10273a <__alltraps>

00102362 <vector174>:
.globl vector174
vector174:
  pushl $0
  102362:	6a 00                	push   $0x0
  pushl $174
  102364:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102369:	e9 cc 03 00 00       	jmp    10273a <__alltraps>

0010236e <vector175>:
.globl vector175
vector175:
  pushl $0
  10236e:	6a 00                	push   $0x0
  pushl $175
  102370:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102375:	e9 c0 03 00 00       	jmp    10273a <__alltraps>

0010237a <vector176>:
.globl vector176
vector176:
  pushl $0
  10237a:	6a 00                	push   $0x0
  pushl $176
  10237c:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102381:	e9 b4 03 00 00       	jmp    10273a <__alltraps>

00102386 <vector177>:
.globl vector177
vector177:
  pushl $0
  102386:	6a 00                	push   $0x0
  pushl $177
  102388:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10238d:	e9 a8 03 00 00       	jmp    10273a <__alltraps>

00102392 <vector178>:
.globl vector178
vector178:
  pushl $0
  102392:	6a 00                	push   $0x0
  pushl $178
  102394:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102399:	e9 9c 03 00 00       	jmp    10273a <__alltraps>

0010239e <vector179>:
.globl vector179
vector179:
  pushl $0
  10239e:	6a 00                	push   $0x0
  pushl $179
  1023a0:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1023a5:	e9 90 03 00 00       	jmp    10273a <__alltraps>

001023aa <vector180>:
.globl vector180
vector180:
  pushl $0
  1023aa:	6a 00                	push   $0x0
  pushl $180
  1023ac:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1023b1:	e9 84 03 00 00       	jmp    10273a <__alltraps>

001023b6 <vector181>:
.globl vector181
vector181:
  pushl $0
  1023b6:	6a 00                	push   $0x0
  pushl $181
  1023b8:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1023bd:	e9 78 03 00 00       	jmp    10273a <__alltraps>

001023c2 <vector182>:
.globl vector182
vector182:
  pushl $0
  1023c2:	6a 00                	push   $0x0
  pushl $182
  1023c4:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1023c9:	e9 6c 03 00 00       	jmp    10273a <__alltraps>

001023ce <vector183>:
.globl vector183
vector183:
  pushl $0
  1023ce:	6a 00                	push   $0x0
  pushl $183
  1023d0:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1023d5:	e9 60 03 00 00       	jmp    10273a <__alltraps>

001023da <vector184>:
.globl vector184
vector184:
  pushl $0
  1023da:	6a 00                	push   $0x0
  pushl $184
  1023dc:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1023e1:	e9 54 03 00 00       	jmp    10273a <__alltraps>

001023e6 <vector185>:
.globl vector185
vector185:
  pushl $0
  1023e6:	6a 00                	push   $0x0
  pushl $185
  1023e8:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1023ed:	e9 48 03 00 00       	jmp    10273a <__alltraps>

001023f2 <vector186>:
.globl vector186
vector186:
  pushl $0
  1023f2:	6a 00                	push   $0x0
  pushl $186
  1023f4:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1023f9:	e9 3c 03 00 00       	jmp    10273a <__alltraps>

001023fe <vector187>:
.globl vector187
vector187:
  pushl $0
  1023fe:	6a 00                	push   $0x0
  pushl $187
  102400:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102405:	e9 30 03 00 00       	jmp    10273a <__alltraps>

0010240a <vector188>:
.globl vector188
vector188:
  pushl $0
  10240a:	6a 00                	push   $0x0
  pushl $188
  10240c:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102411:	e9 24 03 00 00       	jmp    10273a <__alltraps>

00102416 <vector189>:
.globl vector189
vector189:
  pushl $0
  102416:	6a 00                	push   $0x0
  pushl $189
  102418:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10241d:	e9 18 03 00 00       	jmp    10273a <__alltraps>

00102422 <vector190>:
.globl vector190
vector190:
  pushl $0
  102422:	6a 00                	push   $0x0
  pushl $190
  102424:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102429:	e9 0c 03 00 00       	jmp    10273a <__alltraps>

0010242e <vector191>:
.globl vector191
vector191:
  pushl $0
  10242e:	6a 00                	push   $0x0
  pushl $191
  102430:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102435:	e9 00 03 00 00       	jmp    10273a <__alltraps>

0010243a <vector192>:
.globl vector192
vector192:
  pushl $0
  10243a:	6a 00                	push   $0x0
  pushl $192
  10243c:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102441:	e9 f4 02 00 00       	jmp    10273a <__alltraps>

00102446 <vector193>:
.globl vector193
vector193:
  pushl $0
  102446:	6a 00                	push   $0x0
  pushl $193
  102448:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10244d:	e9 e8 02 00 00       	jmp    10273a <__alltraps>

00102452 <vector194>:
.globl vector194
vector194:
  pushl $0
  102452:	6a 00                	push   $0x0
  pushl $194
  102454:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102459:	e9 dc 02 00 00       	jmp    10273a <__alltraps>

0010245e <vector195>:
.globl vector195
vector195:
  pushl $0
  10245e:	6a 00                	push   $0x0
  pushl $195
  102460:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102465:	e9 d0 02 00 00       	jmp    10273a <__alltraps>

0010246a <vector196>:
.globl vector196
vector196:
  pushl $0
  10246a:	6a 00                	push   $0x0
  pushl $196
  10246c:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102471:	e9 c4 02 00 00       	jmp    10273a <__alltraps>

00102476 <vector197>:
.globl vector197
vector197:
  pushl $0
  102476:	6a 00                	push   $0x0
  pushl $197
  102478:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10247d:	e9 b8 02 00 00       	jmp    10273a <__alltraps>

00102482 <vector198>:
.globl vector198
vector198:
  pushl $0
  102482:	6a 00                	push   $0x0
  pushl $198
  102484:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102489:	e9 ac 02 00 00       	jmp    10273a <__alltraps>

0010248e <vector199>:
.globl vector199
vector199:
  pushl $0
  10248e:	6a 00                	push   $0x0
  pushl $199
  102490:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102495:	e9 a0 02 00 00       	jmp    10273a <__alltraps>

0010249a <vector200>:
.globl vector200
vector200:
  pushl $0
  10249a:	6a 00                	push   $0x0
  pushl $200
  10249c:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1024a1:	e9 94 02 00 00       	jmp    10273a <__alltraps>

001024a6 <vector201>:
.globl vector201
vector201:
  pushl $0
  1024a6:	6a 00                	push   $0x0
  pushl $201
  1024a8:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1024ad:	e9 88 02 00 00       	jmp    10273a <__alltraps>

001024b2 <vector202>:
.globl vector202
vector202:
  pushl $0
  1024b2:	6a 00                	push   $0x0
  pushl $202
  1024b4:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1024b9:	e9 7c 02 00 00       	jmp    10273a <__alltraps>

001024be <vector203>:
.globl vector203
vector203:
  pushl $0
  1024be:	6a 00                	push   $0x0
  pushl $203
  1024c0:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1024c5:	e9 70 02 00 00       	jmp    10273a <__alltraps>

001024ca <vector204>:
.globl vector204
vector204:
  pushl $0
  1024ca:	6a 00                	push   $0x0
  pushl $204
  1024cc:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1024d1:	e9 64 02 00 00       	jmp    10273a <__alltraps>

001024d6 <vector205>:
.globl vector205
vector205:
  pushl $0
  1024d6:	6a 00                	push   $0x0
  pushl $205
  1024d8:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1024dd:	e9 58 02 00 00       	jmp    10273a <__alltraps>

001024e2 <vector206>:
.globl vector206
vector206:
  pushl $0
  1024e2:	6a 00                	push   $0x0
  pushl $206
  1024e4:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1024e9:	e9 4c 02 00 00       	jmp    10273a <__alltraps>

001024ee <vector207>:
.globl vector207
vector207:
  pushl $0
  1024ee:	6a 00                	push   $0x0
  pushl $207
  1024f0:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1024f5:	e9 40 02 00 00       	jmp    10273a <__alltraps>

001024fa <vector208>:
.globl vector208
vector208:
  pushl $0
  1024fa:	6a 00                	push   $0x0
  pushl $208
  1024fc:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102501:	e9 34 02 00 00       	jmp    10273a <__alltraps>

00102506 <vector209>:
.globl vector209
vector209:
  pushl $0
  102506:	6a 00                	push   $0x0
  pushl $209
  102508:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10250d:	e9 28 02 00 00       	jmp    10273a <__alltraps>

00102512 <vector210>:
.globl vector210
vector210:
  pushl $0
  102512:	6a 00                	push   $0x0
  pushl $210
  102514:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102519:	e9 1c 02 00 00       	jmp    10273a <__alltraps>

0010251e <vector211>:
.globl vector211
vector211:
  pushl $0
  10251e:	6a 00                	push   $0x0
  pushl $211
  102520:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102525:	e9 10 02 00 00       	jmp    10273a <__alltraps>

0010252a <vector212>:
.globl vector212
vector212:
  pushl $0
  10252a:	6a 00                	push   $0x0
  pushl $212
  10252c:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102531:	e9 04 02 00 00       	jmp    10273a <__alltraps>

00102536 <vector213>:
.globl vector213
vector213:
  pushl $0
  102536:	6a 00                	push   $0x0
  pushl $213
  102538:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10253d:	e9 f8 01 00 00       	jmp    10273a <__alltraps>

00102542 <vector214>:
.globl vector214
vector214:
  pushl $0
  102542:	6a 00                	push   $0x0
  pushl $214
  102544:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102549:	e9 ec 01 00 00       	jmp    10273a <__alltraps>

0010254e <vector215>:
.globl vector215
vector215:
  pushl $0
  10254e:	6a 00                	push   $0x0
  pushl $215
  102550:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102555:	e9 e0 01 00 00       	jmp    10273a <__alltraps>

0010255a <vector216>:
.globl vector216
vector216:
  pushl $0
  10255a:	6a 00                	push   $0x0
  pushl $216
  10255c:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102561:	e9 d4 01 00 00       	jmp    10273a <__alltraps>

00102566 <vector217>:
.globl vector217
vector217:
  pushl $0
  102566:	6a 00                	push   $0x0
  pushl $217
  102568:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10256d:	e9 c8 01 00 00       	jmp    10273a <__alltraps>

00102572 <vector218>:
.globl vector218
vector218:
  pushl $0
  102572:	6a 00                	push   $0x0
  pushl $218
  102574:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102579:	e9 bc 01 00 00       	jmp    10273a <__alltraps>

0010257e <vector219>:
.globl vector219
vector219:
  pushl $0
  10257e:	6a 00                	push   $0x0
  pushl $219
  102580:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102585:	e9 b0 01 00 00       	jmp    10273a <__alltraps>

0010258a <vector220>:
.globl vector220
vector220:
  pushl $0
  10258a:	6a 00                	push   $0x0
  pushl $220
  10258c:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102591:	e9 a4 01 00 00       	jmp    10273a <__alltraps>

00102596 <vector221>:
.globl vector221
vector221:
  pushl $0
  102596:	6a 00                	push   $0x0
  pushl $221
  102598:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10259d:	e9 98 01 00 00       	jmp    10273a <__alltraps>

001025a2 <vector222>:
.globl vector222
vector222:
  pushl $0
  1025a2:	6a 00                	push   $0x0
  pushl $222
  1025a4:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1025a9:	e9 8c 01 00 00       	jmp    10273a <__alltraps>

001025ae <vector223>:
.globl vector223
vector223:
  pushl $0
  1025ae:	6a 00                	push   $0x0
  pushl $223
  1025b0:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1025b5:	e9 80 01 00 00       	jmp    10273a <__alltraps>

001025ba <vector224>:
.globl vector224
vector224:
  pushl $0
  1025ba:	6a 00                	push   $0x0
  pushl $224
  1025bc:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1025c1:	e9 74 01 00 00       	jmp    10273a <__alltraps>

001025c6 <vector225>:
.globl vector225
vector225:
  pushl $0
  1025c6:	6a 00                	push   $0x0
  pushl $225
  1025c8:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1025cd:	e9 68 01 00 00       	jmp    10273a <__alltraps>

001025d2 <vector226>:
.globl vector226
vector226:
  pushl $0
  1025d2:	6a 00                	push   $0x0
  pushl $226
  1025d4:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1025d9:	e9 5c 01 00 00       	jmp    10273a <__alltraps>

001025de <vector227>:
.globl vector227
vector227:
  pushl $0
  1025de:	6a 00                	push   $0x0
  pushl $227
  1025e0:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1025e5:	e9 50 01 00 00       	jmp    10273a <__alltraps>

001025ea <vector228>:
.globl vector228
vector228:
  pushl $0
  1025ea:	6a 00                	push   $0x0
  pushl $228
  1025ec:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1025f1:	e9 44 01 00 00       	jmp    10273a <__alltraps>

001025f6 <vector229>:
.globl vector229
vector229:
  pushl $0
  1025f6:	6a 00                	push   $0x0
  pushl $229
  1025f8:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1025fd:	e9 38 01 00 00       	jmp    10273a <__alltraps>

00102602 <vector230>:
.globl vector230
vector230:
  pushl $0
  102602:	6a 00                	push   $0x0
  pushl $230
  102604:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102609:	e9 2c 01 00 00       	jmp    10273a <__alltraps>

0010260e <vector231>:
.globl vector231
vector231:
  pushl $0
  10260e:	6a 00                	push   $0x0
  pushl $231
  102610:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102615:	e9 20 01 00 00       	jmp    10273a <__alltraps>

0010261a <vector232>:
.globl vector232
vector232:
  pushl $0
  10261a:	6a 00                	push   $0x0
  pushl $232
  10261c:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102621:	e9 14 01 00 00       	jmp    10273a <__alltraps>

00102626 <vector233>:
.globl vector233
vector233:
  pushl $0
  102626:	6a 00                	push   $0x0
  pushl $233
  102628:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10262d:	e9 08 01 00 00       	jmp    10273a <__alltraps>

00102632 <vector234>:
.globl vector234
vector234:
  pushl $0
  102632:	6a 00                	push   $0x0
  pushl $234
  102634:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102639:	e9 fc 00 00 00       	jmp    10273a <__alltraps>

0010263e <vector235>:
.globl vector235
vector235:
  pushl $0
  10263e:	6a 00                	push   $0x0
  pushl $235
  102640:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102645:	e9 f0 00 00 00       	jmp    10273a <__alltraps>

0010264a <vector236>:
.globl vector236
vector236:
  pushl $0
  10264a:	6a 00                	push   $0x0
  pushl $236
  10264c:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102651:	e9 e4 00 00 00       	jmp    10273a <__alltraps>

00102656 <vector237>:
.globl vector237
vector237:
  pushl $0
  102656:	6a 00                	push   $0x0
  pushl $237
  102658:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10265d:	e9 d8 00 00 00       	jmp    10273a <__alltraps>

00102662 <vector238>:
.globl vector238
vector238:
  pushl $0
  102662:	6a 00                	push   $0x0
  pushl $238
  102664:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102669:	e9 cc 00 00 00       	jmp    10273a <__alltraps>

0010266e <vector239>:
.globl vector239
vector239:
  pushl $0
  10266e:	6a 00                	push   $0x0
  pushl $239
  102670:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102675:	e9 c0 00 00 00       	jmp    10273a <__alltraps>

0010267a <vector240>:
.globl vector240
vector240:
  pushl $0
  10267a:	6a 00                	push   $0x0
  pushl $240
  10267c:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102681:	e9 b4 00 00 00       	jmp    10273a <__alltraps>

00102686 <vector241>:
.globl vector241
vector241:
  pushl $0
  102686:	6a 00                	push   $0x0
  pushl $241
  102688:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10268d:	e9 a8 00 00 00       	jmp    10273a <__alltraps>

00102692 <vector242>:
.globl vector242
vector242:
  pushl $0
  102692:	6a 00                	push   $0x0
  pushl $242
  102694:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102699:	e9 9c 00 00 00       	jmp    10273a <__alltraps>

0010269e <vector243>:
.globl vector243
vector243:
  pushl $0
  10269e:	6a 00                	push   $0x0
  pushl $243
  1026a0:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1026a5:	e9 90 00 00 00       	jmp    10273a <__alltraps>

001026aa <vector244>:
.globl vector244
vector244:
  pushl $0
  1026aa:	6a 00                	push   $0x0
  pushl $244
  1026ac:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1026b1:	e9 84 00 00 00       	jmp    10273a <__alltraps>

001026b6 <vector245>:
.globl vector245
vector245:
  pushl $0
  1026b6:	6a 00                	push   $0x0
  pushl $245
  1026b8:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1026bd:	e9 78 00 00 00       	jmp    10273a <__alltraps>

001026c2 <vector246>:
.globl vector246
vector246:
  pushl $0
  1026c2:	6a 00                	push   $0x0
  pushl $246
  1026c4:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1026c9:	e9 6c 00 00 00       	jmp    10273a <__alltraps>

001026ce <vector247>:
.globl vector247
vector247:
  pushl $0
  1026ce:	6a 00                	push   $0x0
  pushl $247
  1026d0:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1026d5:	e9 60 00 00 00       	jmp    10273a <__alltraps>

001026da <vector248>:
.globl vector248
vector248:
  pushl $0
  1026da:	6a 00                	push   $0x0
  pushl $248
  1026dc:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1026e1:	e9 54 00 00 00       	jmp    10273a <__alltraps>

001026e6 <vector249>:
.globl vector249
vector249:
  pushl $0
  1026e6:	6a 00                	push   $0x0
  pushl $249
  1026e8:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1026ed:	e9 48 00 00 00       	jmp    10273a <__alltraps>

001026f2 <vector250>:
.globl vector250
vector250:
  pushl $0
  1026f2:	6a 00                	push   $0x0
  pushl $250
  1026f4:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1026f9:	e9 3c 00 00 00       	jmp    10273a <__alltraps>

001026fe <vector251>:
.globl vector251
vector251:
  pushl $0
  1026fe:	6a 00                	push   $0x0
  pushl $251
  102700:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102705:	e9 30 00 00 00       	jmp    10273a <__alltraps>

0010270a <vector252>:
.globl vector252
vector252:
  pushl $0
  10270a:	6a 00                	push   $0x0
  pushl $252
  10270c:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102711:	e9 24 00 00 00       	jmp    10273a <__alltraps>

00102716 <vector253>:
.globl vector253
vector253:
  pushl $0
  102716:	6a 00                	push   $0x0
  pushl $253
  102718:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10271d:	e9 18 00 00 00       	jmp    10273a <__alltraps>

00102722 <vector254>:
.globl vector254
vector254:
  pushl $0
  102722:	6a 00                	push   $0x0
  pushl $254
  102724:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102729:	e9 0c 00 00 00       	jmp    10273a <__alltraps>

0010272e <vector255>:
.globl vector255
vector255:
  pushl $0
  10272e:	6a 00                	push   $0x0
  pushl $255
  102730:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102735:	e9 00 00 00 00       	jmp    10273a <__alltraps>

0010273a <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  10273a:	1e                   	push   %ds
    pushl %es
  10273b:	06                   	push   %es
    pushl %fs
  10273c:	0f a0                	push   %fs
    pushl %gs
  10273e:	0f a8                	push   %gs
    pushal
  102740:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102741:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102746:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102748:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  10274a:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10274b:	e8 63 f5 ff ff       	call   101cb3 <trap>

    # pop the pushed stack pointer
    popl %esp
  102750:	5c                   	pop    %esp

00102751 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102751:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102752:	0f a9                	pop    %gs
    popl %fs
  102754:	0f a1                	pop    %fs
    popl %es
  102756:	07                   	pop    %es
    popl %ds
  102757:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102758:	83 c4 08             	add    $0x8,%esp
    iret
  10275b:	cf                   	iret   

0010275c <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  10275c:	55                   	push   %ebp
  10275d:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10275f:	8b 45 08             	mov    0x8(%ebp),%eax
  102762:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102765:	b8 23 00 00 00       	mov    $0x23,%eax
  10276a:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  10276c:	b8 23 00 00 00       	mov    $0x23,%eax
  102771:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102773:	b8 10 00 00 00       	mov    $0x10,%eax
  102778:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10277a:	b8 10 00 00 00       	mov    $0x10,%eax
  10277f:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102781:	b8 10 00 00 00       	mov    $0x10,%eax
  102786:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102788:	ea 8f 27 10 00 08 00 	ljmp   $0x8,$0x10278f
}
  10278f:	90                   	nop
  102790:	5d                   	pop    %ebp
  102791:	c3                   	ret    

00102792 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102792:	55                   	push   %ebp
  102793:	89 e5                	mov    %esp,%ebp
  102795:	83 ec 10             	sub    $0x10,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102798:	b8 40 f9 10 00       	mov    $0x10f940,%eax
  10279d:	05 00 04 00 00       	add    $0x400,%eax
  1027a2:	a3 c4 f8 10 00       	mov    %eax,0x10f8c4
    ts.ts_ss0 = KERNEL_DS;
  1027a7:	66 c7 05 c8 f8 10 00 	movw   $0x10,0x10f8c8
  1027ae:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1027b0:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1027b7:	68 00 
  1027b9:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  1027be:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1027c4:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  1027c9:	c1 e8 10             	shr    $0x10,%eax
  1027cc:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1027d1:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1027d8:	83 e0 f0             	and    $0xfffffff0,%eax
  1027db:	83 c8 09             	or     $0x9,%eax
  1027de:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1027e3:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1027ea:	83 c8 10             	or     $0x10,%eax
  1027ed:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1027f2:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1027f9:	83 e0 9f             	and    $0xffffff9f,%eax
  1027fc:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102801:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102808:	83 c8 80             	or     $0xffffff80,%eax
  10280b:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102810:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102817:	83 e0 f0             	and    $0xfffffff0,%eax
  10281a:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10281f:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102826:	83 e0 ef             	and    $0xffffffef,%eax
  102829:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10282e:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102835:	83 e0 df             	and    $0xffffffdf,%eax
  102838:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10283d:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102844:	83 c8 40             	or     $0x40,%eax
  102847:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10284c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102853:	83 e0 7f             	and    $0x7f,%eax
  102856:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10285b:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102860:	c1 e8 18             	shr    $0x18,%eax
  102863:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102868:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10286f:	83 e0 ef             	and    $0xffffffef,%eax
  102872:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102877:	68 10 ea 10 00       	push   $0x10ea10
  10287c:	e8 db fe ff ff       	call   10275c <lgdt>
  102881:	83 c4 04             	add    $0x4,%esp
  102884:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  10288a:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  10288e:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102891:	90                   	nop
  102892:	c9                   	leave  
  102893:	c3                   	ret    

00102894 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102894:	55                   	push   %ebp
  102895:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102897:	e8 f6 fe ff ff       	call   102792 <gdt_init>
}
  10289c:	90                   	nop
  10289d:	5d                   	pop    %ebp
  10289e:	c3                   	ret    

0010289f <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  10289f:	55                   	push   %ebp
  1028a0:	89 e5                	mov    %esp,%ebp
  1028a2:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1028a5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1028ac:	eb 04                	jmp    1028b2 <strlen+0x13>
        cnt ++;
  1028ae:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  1028b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1028b5:	8d 50 01             	lea    0x1(%eax),%edx
  1028b8:	89 55 08             	mov    %edx,0x8(%ebp)
  1028bb:	0f b6 00             	movzbl (%eax),%eax
  1028be:	84 c0                	test   %al,%al
  1028c0:	75 ec                	jne    1028ae <strlen+0xf>
        cnt ++;
    }
    return cnt;
  1028c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1028c5:	c9                   	leave  
  1028c6:	c3                   	ret    

001028c7 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1028c7:	55                   	push   %ebp
  1028c8:	89 e5                	mov    %esp,%ebp
  1028ca:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1028cd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1028d4:	eb 04                	jmp    1028da <strnlen+0x13>
        cnt ++;
  1028d6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  1028da:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1028dd:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1028e0:	73 10                	jae    1028f2 <strnlen+0x2b>
  1028e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1028e5:	8d 50 01             	lea    0x1(%eax),%edx
  1028e8:	89 55 08             	mov    %edx,0x8(%ebp)
  1028eb:	0f b6 00             	movzbl (%eax),%eax
  1028ee:	84 c0                	test   %al,%al
  1028f0:	75 e4                	jne    1028d6 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  1028f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1028f5:	c9                   	leave  
  1028f6:	c3                   	ret    

001028f7 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  1028f7:	55                   	push   %ebp
  1028f8:	89 e5                	mov    %esp,%ebp
  1028fa:	57                   	push   %edi
  1028fb:	56                   	push   %esi
  1028fc:	83 ec 20             	sub    $0x20,%esp
  1028ff:	8b 45 08             	mov    0x8(%ebp),%eax
  102902:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102905:	8b 45 0c             	mov    0xc(%ebp),%eax
  102908:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  10290b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10290e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102911:	89 d1                	mov    %edx,%ecx
  102913:	89 c2                	mov    %eax,%edx
  102915:	89 ce                	mov    %ecx,%esi
  102917:	89 d7                	mov    %edx,%edi
  102919:	ac                   	lods   %ds:(%esi),%al
  10291a:	aa                   	stos   %al,%es:(%edi)
  10291b:	84 c0                	test   %al,%al
  10291d:	75 fa                	jne    102919 <strcpy+0x22>
  10291f:	89 fa                	mov    %edi,%edx
  102921:	89 f1                	mov    %esi,%ecx
  102923:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102926:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102929:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  10292c:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  10292f:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102930:	83 c4 20             	add    $0x20,%esp
  102933:	5e                   	pop    %esi
  102934:	5f                   	pop    %edi
  102935:	5d                   	pop    %ebp
  102936:	c3                   	ret    

00102937 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102937:	55                   	push   %ebp
  102938:	89 e5                	mov    %esp,%ebp
  10293a:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  10293d:	8b 45 08             	mov    0x8(%ebp),%eax
  102940:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102943:	eb 21                	jmp    102966 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102945:	8b 45 0c             	mov    0xc(%ebp),%eax
  102948:	0f b6 10             	movzbl (%eax),%edx
  10294b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10294e:	88 10                	mov    %dl,(%eax)
  102950:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102953:	0f b6 00             	movzbl (%eax),%eax
  102956:	84 c0                	test   %al,%al
  102958:	74 04                	je     10295e <strncpy+0x27>
            src ++;
  10295a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  10295e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102962:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102966:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10296a:	75 d9                	jne    102945 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  10296c:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10296f:	c9                   	leave  
  102970:	c3                   	ret    

00102971 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102971:	55                   	push   %ebp
  102972:	89 e5                	mov    %esp,%ebp
  102974:	57                   	push   %edi
  102975:	56                   	push   %esi
  102976:	83 ec 20             	sub    $0x20,%esp
  102979:	8b 45 08             	mov    0x8(%ebp),%eax
  10297c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10297f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102982:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102985:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102988:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10298b:	89 d1                	mov    %edx,%ecx
  10298d:	89 c2                	mov    %eax,%edx
  10298f:	89 ce                	mov    %ecx,%esi
  102991:	89 d7                	mov    %edx,%edi
  102993:	ac                   	lods   %ds:(%esi),%al
  102994:	ae                   	scas   %es:(%edi),%al
  102995:	75 08                	jne    10299f <strcmp+0x2e>
  102997:	84 c0                	test   %al,%al
  102999:	75 f8                	jne    102993 <strcmp+0x22>
  10299b:	31 c0                	xor    %eax,%eax
  10299d:	eb 04                	jmp    1029a3 <strcmp+0x32>
  10299f:	19 c0                	sbb    %eax,%eax
  1029a1:	0c 01                	or     $0x1,%al
  1029a3:	89 fa                	mov    %edi,%edx
  1029a5:	89 f1                	mov    %esi,%ecx
  1029a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1029aa:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1029ad:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  1029b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  1029b3:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1029b4:	83 c4 20             	add    $0x20,%esp
  1029b7:	5e                   	pop    %esi
  1029b8:	5f                   	pop    %edi
  1029b9:	5d                   	pop    %ebp
  1029ba:	c3                   	ret    

001029bb <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1029bb:	55                   	push   %ebp
  1029bc:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1029be:	eb 0c                	jmp    1029cc <strncmp+0x11>
        n --, s1 ++, s2 ++;
  1029c0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1029c4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1029c8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1029cc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029d0:	74 1a                	je     1029ec <strncmp+0x31>
  1029d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1029d5:	0f b6 00             	movzbl (%eax),%eax
  1029d8:	84 c0                	test   %al,%al
  1029da:	74 10                	je     1029ec <strncmp+0x31>
  1029dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1029df:	0f b6 10             	movzbl (%eax),%edx
  1029e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029e5:	0f b6 00             	movzbl (%eax),%eax
  1029e8:	38 c2                	cmp    %al,%dl
  1029ea:	74 d4                	je     1029c0 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1029ec:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029f0:	74 18                	je     102a0a <strncmp+0x4f>
  1029f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f5:	0f b6 00             	movzbl (%eax),%eax
  1029f8:	0f b6 d0             	movzbl %al,%edx
  1029fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029fe:	0f b6 00             	movzbl (%eax),%eax
  102a01:	0f b6 c0             	movzbl %al,%eax
  102a04:	29 c2                	sub    %eax,%edx
  102a06:	89 d0                	mov    %edx,%eax
  102a08:	eb 05                	jmp    102a0f <strncmp+0x54>
  102a0a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102a0f:	5d                   	pop    %ebp
  102a10:	c3                   	ret    

00102a11 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102a11:	55                   	push   %ebp
  102a12:	89 e5                	mov    %esp,%ebp
  102a14:	83 ec 04             	sub    $0x4,%esp
  102a17:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a1a:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102a1d:	eb 14                	jmp    102a33 <strchr+0x22>
        if (*s == c) {
  102a1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a22:	0f b6 00             	movzbl (%eax),%eax
  102a25:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102a28:	75 05                	jne    102a2f <strchr+0x1e>
            return (char *)s;
  102a2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a2d:	eb 13                	jmp    102a42 <strchr+0x31>
        }
        s ++;
  102a2f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102a33:	8b 45 08             	mov    0x8(%ebp),%eax
  102a36:	0f b6 00             	movzbl (%eax),%eax
  102a39:	84 c0                	test   %al,%al
  102a3b:	75 e2                	jne    102a1f <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102a3d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102a42:	c9                   	leave  
  102a43:	c3                   	ret    

00102a44 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102a44:	55                   	push   %ebp
  102a45:	89 e5                	mov    %esp,%ebp
  102a47:	83 ec 04             	sub    $0x4,%esp
  102a4a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a4d:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102a50:	eb 0f                	jmp    102a61 <strfind+0x1d>
        if (*s == c) {
  102a52:	8b 45 08             	mov    0x8(%ebp),%eax
  102a55:	0f b6 00             	movzbl (%eax),%eax
  102a58:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102a5b:	74 10                	je     102a6d <strfind+0x29>
            break;
        }
        s ++;
  102a5d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102a61:	8b 45 08             	mov    0x8(%ebp),%eax
  102a64:	0f b6 00             	movzbl (%eax),%eax
  102a67:	84 c0                	test   %al,%al
  102a69:	75 e7                	jne    102a52 <strfind+0xe>
  102a6b:	eb 01                	jmp    102a6e <strfind+0x2a>
        if (*s == c) {
            break;
  102a6d:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  102a6e:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102a71:	c9                   	leave  
  102a72:	c3                   	ret    

00102a73 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102a73:	55                   	push   %ebp
  102a74:	89 e5                	mov    %esp,%ebp
  102a76:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102a79:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102a80:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102a87:	eb 04                	jmp    102a8d <strtol+0x1a>
        s ++;
  102a89:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102a8d:	8b 45 08             	mov    0x8(%ebp),%eax
  102a90:	0f b6 00             	movzbl (%eax),%eax
  102a93:	3c 20                	cmp    $0x20,%al
  102a95:	74 f2                	je     102a89 <strtol+0x16>
  102a97:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9a:	0f b6 00             	movzbl (%eax),%eax
  102a9d:	3c 09                	cmp    $0x9,%al
  102a9f:	74 e8                	je     102a89 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102aa1:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa4:	0f b6 00             	movzbl (%eax),%eax
  102aa7:	3c 2b                	cmp    $0x2b,%al
  102aa9:	75 06                	jne    102ab1 <strtol+0x3e>
        s ++;
  102aab:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102aaf:	eb 15                	jmp    102ac6 <strtol+0x53>
    }
    else if (*s == '-') {
  102ab1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ab4:	0f b6 00             	movzbl (%eax),%eax
  102ab7:	3c 2d                	cmp    $0x2d,%al
  102ab9:	75 0b                	jne    102ac6 <strtol+0x53>
        s ++, neg = 1;
  102abb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102abf:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102ac6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102aca:	74 06                	je     102ad2 <strtol+0x5f>
  102acc:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102ad0:	75 24                	jne    102af6 <strtol+0x83>
  102ad2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad5:	0f b6 00             	movzbl (%eax),%eax
  102ad8:	3c 30                	cmp    $0x30,%al
  102ada:	75 1a                	jne    102af6 <strtol+0x83>
  102adc:	8b 45 08             	mov    0x8(%ebp),%eax
  102adf:	83 c0 01             	add    $0x1,%eax
  102ae2:	0f b6 00             	movzbl (%eax),%eax
  102ae5:	3c 78                	cmp    $0x78,%al
  102ae7:	75 0d                	jne    102af6 <strtol+0x83>
        s += 2, base = 16;
  102ae9:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102aed:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102af4:	eb 2a                	jmp    102b20 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102af6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102afa:	75 17                	jne    102b13 <strtol+0xa0>
  102afc:	8b 45 08             	mov    0x8(%ebp),%eax
  102aff:	0f b6 00             	movzbl (%eax),%eax
  102b02:	3c 30                	cmp    $0x30,%al
  102b04:	75 0d                	jne    102b13 <strtol+0xa0>
        s ++, base = 8;
  102b06:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b0a:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102b11:	eb 0d                	jmp    102b20 <strtol+0xad>
    }
    else if (base == 0) {
  102b13:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b17:	75 07                	jne    102b20 <strtol+0xad>
        base = 10;
  102b19:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102b20:	8b 45 08             	mov    0x8(%ebp),%eax
  102b23:	0f b6 00             	movzbl (%eax),%eax
  102b26:	3c 2f                	cmp    $0x2f,%al
  102b28:	7e 1b                	jle    102b45 <strtol+0xd2>
  102b2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b2d:	0f b6 00             	movzbl (%eax),%eax
  102b30:	3c 39                	cmp    $0x39,%al
  102b32:	7f 11                	jg     102b45 <strtol+0xd2>
            dig = *s - '0';
  102b34:	8b 45 08             	mov    0x8(%ebp),%eax
  102b37:	0f b6 00             	movzbl (%eax),%eax
  102b3a:	0f be c0             	movsbl %al,%eax
  102b3d:	83 e8 30             	sub    $0x30,%eax
  102b40:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b43:	eb 48                	jmp    102b8d <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102b45:	8b 45 08             	mov    0x8(%ebp),%eax
  102b48:	0f b6 00             	movzbl (%eax),%eax
  102b4b:	3c 60                	cmp    $0x60,%al
  102b4d:	7e 1b                	jle    102b6a <strtol+0xf7>
  102b4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b52:	0f b6 00             	movzbl (%eax),%eax
  102b55:	3c 7a                	cmp    $0x7a,%al
  102b57:	7f 11                	jg     102b6a <strtol+0xf7>
            dig = *s - 'a' + 10;
  102b59:	8b 45 08             	mov    0x8(%ebp),%eax
  102b5c:	0f b6 00             	movzbl (%eax),%eax
  102b5f:	0f be c0             	movsbl %al,%eax
  102b62:	83 e8 57             	sub    $0x57,%eax
  102b65:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b68:	eb 23                	jmp    102b8d <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102b6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6d:	0f b6 00             	movzbl (%eax),%eax
  102b70:	3c 40                	cmp    $0x40,%al
  102b72:	7e 3c                	jle    102bb0 <strtol+0x13d>
  102b74:	8b 45 08             	mov    0x8(%ebp),%eax
  102b77:	0f b6 00             	movzbl (%eax),%eax
  102b7a:	3c 5a                	cmp    $0x5a,%al
  102b7c:	7f 32                	jg     102bb0 <strtol+0x13d>
            dig = *s - 'A' + 10;
  102b7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102b81:	0f b6 00             	movzbl (%eax),%eax
  102b84:	0f be c0             	movsbl %al,%eax
  102b87:	83 e8 37             	sub    $0x37,%eax
  102b8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102b8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b90:	3b 45 10             	cmp    0x10(%ebp),%eax
  102b93:	7d 1a                	jge    102baf <strtol+0x13c>
            break;
        }
        s ++, val = (val * base) + dig;
  102b95:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b99:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b9c:	0f af 45 10          	imul   0x10(%ebp),%eax
  102ba0:	89 c2                	mov    %eax,%edx
  102ba2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ba5:	01 d0                	add    %edx,%eax
  102ba7:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102baa:	e9 71 ff ff ff       	jmp    102b20 <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  102baf:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  102bb0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102bb4:	74 08                	je     102bbe <strtol+0x14b>
        *endptr = (char *) s;
  102bb6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bb9:	8b 55 08             	mov    0x8(%ebp),%edx
  102bbc:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102bbe:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102bc2:	74 07                	je     102bcb <strtol+0x158>
  102bc4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102bc7:	f7 d8                	neg    %eax
  102bc9:	eb 03                	jmp    102bce <strtol+0x15b>
  102bcb:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102bce:	c9                   	leave  
  102bcf:	c3                   	ret    

00102bd0 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102bd0:	55                   	push   %ebp
  102bd1:	89 e5                	mov    %esp,%ebp
  102bd3:	57                   	push   %edi
  102bd4:	83 ec 24             	sub    $0x24,%esp
  102bd7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bda:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102bdd:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102be1:	8b 55 08             	mov    0x8(%ebp),%edx
  102be4:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102be7:	88 45 f7             	mov    %al,-0x9(%ebp)
  102bea:	8b 45 10             	mov    0x10(%ebp),%eax
  102bed:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102bf0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102bf3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102bf7:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102bfa:	89 d7                	mov    %edx,%edi
  102bfc:	f3 aa                	rep stos %al,%es:(%edi)
  102bfe:	89 fa                	mov    %edi,%edx
  102c00:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102c03:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102c06:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c09:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102c0a:	83 c4 24             	add    $0x24,%esp
  102c0d:	5f                   	pop    %edi
  102c0e:	5d                   	pop    %ebp
  102c0f:	c3                   	ret    

00102c10 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102c10:	55                   	push   %ebp
  102c11:	89 e5                	mov    %esp,%ebp
  102c13:	57                   	push   %edi
  102c14:	56                   	push   %esi
  102c15:	53                   	push   %ebx
  102c16:	83 ec 30             	sub    $0x30,%esp
  102c19:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c22:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102c25:	8b 45 10             	mov    0x10(%ebp),%eax
  102c28:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102c2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c2e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102c31:	73 42                	jae    102c75 <memmove+0x65>
  102c33:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102c39:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c3c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c42:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102c45:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102c48:	c1 e8 02             	shr    $0x2,%eax
  102c4b:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102c4d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102c50:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c53:	89 d7                	mov    %edx,%edi
  102c55:	89 c6                	mov    %eax,%esi
  102c57:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102c59:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102c5c:	83 e1 03             	and    $0x3,%ecx
  102c5f:	74 02                	je     102c63 <memmove+0x53>
  102c61:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102c63:	89 f0                	mov    %esi,%eax
  102c65:	89 fa                	mov    %edi,%edx
  102c67:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102c6a:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102c6d:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102c70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102c73:	eb 36                	jmp    102cab <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102c75:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c78:	8d 50 ff             	lea    -0x1(%eax),%edx
  102c7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c7e:	01 c2                	add    %eax,%edx
  102c80:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c83:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102c86:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c89:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102c8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c8f:	89 c1                	mov    %eax,%ecx
  102c91:	89 d8                	mov    %ebx,%eax
  102c93:	89 d6                	mov    %edx,%esi
  102c95:	89 c7                	mov    %eax,%edi
  102c97:	fd                   	std    
  102c98:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102c9a:	fc                   	cld    
  102c9b:	89 f8                	mov    %edi,%eax
  102c9d:	89 f2                	mov    %esi,%edx
  102c9f:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102ca2:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102ca5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102ca8:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102cab:	83 c4 30             	add    $0x30,%esp
  102cae:	5b                   	pop    %ebx
  102caf:	5e                   	pop    %esi
  102cb0:	5f                   	pop    %edi
  102cb1:	5d                   	pop    %ebp
  102cb2:	c3                   	ret    

00102cb3 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102cb3:	55                   	push   %ebp
  102cb4:	89 e5                	mov    %esp,%ebp
  102cb6:	57                   	push   %edi
  102cb7:	56                   	push   %esi
  102cb8:	83 ec 20             	sub    $0x20,%esp
  102cbb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102cc1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cc7:	8b 45 10             	mov    0x10(%ebp),%eax
  102cca:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ccd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102cd0:	c1 e8 02             	shr    $0x2,%eax
  102cd3:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102cd5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cdb:	89 d7                	mov    %edx,%edi
  102cdd:	89 c6                	mov    %eax,%esi
  102cdf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ce1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102ce4:	83 e1 03             	and    $0x3,%ecx
  102ce7:	74 02                	je     102ceb <memcpy+0x38>
  102ce9:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ceb:	89 f0                	mov    %esi,%eax
  102ced:	89 fa                	mov    %edi,%edx
  102cef:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102cf2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102cf5:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102cf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102cfb:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102cfc:	83 c4 20             	add    $0x20,%esp
  102cff:	5e                   	pop    %esi
  102d00:	5f                   	pop    %edi
  102d01:	5d                   	pop    %ebp
  102d02:	c3                   	ret    

00102d03 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102d03:	55                   	push   %ebp
  102d04:	89 e5                	mov    %esp,%ebp
  102d06:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102d09:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102d0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d12:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102d15:	eb 30                	jmp    102d47 <memcmp+0x44>
        if (*s1 != *s2) {
  102d17:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d1a:	0f b6 10             	movzbl (%eax),%edx
  102d1d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d20:	0f b6 00             	movzbl (%eax),%eax
  102d23:	38 c2                	cmp    %al,%dl
  102d25:	74 18                	je     102d3f <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102d27:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102d2a:	0f b6 00             	movzbl (%eax),%eax
  102d2d:	0f b6 d0             	movzbl %al,%edx
  102d30:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d33:	0f b6 00             	movzbl (%eax),%eax
  102d36:	0f b6 c0             	movzbl %al,%eax
  102d39:	29 c2                	sub    %eax,%edx
  102d3b:	89 d0                	mov    %edx,%eax
  102d3d:	eb 1a                	jmp    102d59 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102d3f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102d43:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102d47:	8b 45 10             	mov    0x10(%ebp),%eax
  102d4a:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d4d:	89 55 10             	mov    %edx,0x10(%ebp)
  102d50:	85 c0                	test   %eax,%eax
  102d52:	75 c3                	jne    102d17 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102d54:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102d59:	c9                   	leave  
  102d5a:	c3                   	ret    

00102d5b <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102d5b:	55                   	push   %ebp
  102d5c:	89 e5                	mov    %esp,%ebp
  102d5e:	83 ec 38             	sub    $0x38,%esp
  102d61:	8b 45 10             	mov    0x10(%ebp),%eax
  102d64:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102d67:	8b 45 14             	mov    0x14(%ebp),%eax
  102d6a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102d6d:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102d70:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102d73:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d76:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102d79:	8b 45 18             	mov    0x18(%ebp),%eax
  102d7c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102d7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d82:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102d85:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102d88:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102d8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d91:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102d95:	74 1c                	je     102db3 <printnum+0x58>
  102d97:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d9a:	ba 00 00 00 00       	mov    $0x0,%edx
  102d9f:	f7 75 e4             	divl   -0x1c(%ebp)
  102da2:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102da5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102da8:	ba 00 00 00 00       	mov    $0x0,%edx
  102dad:	f7 75 e4             	divl   -0x1c(%ebp)
  102db0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102db3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102db6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102db9:	f7 75 e4             	divl   -0x1c(%ebp)
  102dbc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102dbf:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102dc2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dc5:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102dc8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102dcb:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102dce:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102dd1:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102dd4:	8b 45 18             	mov    0x18(%ebp),%eax
  102dd7:	ba 00 00 00 00       	mov    $0x0,%edx
  102ddc:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102ddf:	77 41                	ja     102e22 <printnum+0xc7>
  102de1:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102de4:	72 05                	jb     102deb <printnum+0x90>
  102de6:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102de9:	77 37                	ja     102e22 <printnum+0xc7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102deb:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102dee:	83 e8 01             	sub    $0x1,%eax
  102df1:	83 ec 04             	sub    $0x4,%esp
  102df4:	ff 75 20             	pushl  0x20(%ebp)
  102df7:	50                   	push   %eax
  102df8:	ff 75 18             	pushl  0x18(%ebp)
  102dfb:	ff 75 ec             	pushl  -0x14(%ebp)
  102dfe:	ff 75 e8             	pushl  -0x18(%ebp)
  102e01:	ff 75 0c             	pushl  0xc(%ebp)
  102e04:	ff 75 08             	pushl  0x8(%ebp)
  102e07:	e8 4f ff ff ff       	call   102d5b <printnum>
  102e0c:	83 c4 20             	add    $0x20,%esp
  102e0f:	eb 1b                	jmp    102e2c <printnum+0xd1>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102e11:	83 ec 08             	sub    $0x8,%esp
  102e14:	ff 75 0c             	pushl  0xc(%ebp)
  102e17:	ff 75 20             	pushl  0x20(%ebp)
  102e1a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1d:	ff d0                	call   *%eax
  102e1f:	83 c4 10             	add    $0x10,%esp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102e22:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102e26:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102e2a:	7f e5                	jg     102e11 <printnum+0xb6>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102e2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102e2f:	05 f0 3a 10 00       	add    $0x103af0,%eax
  102e34:	0f b6 00             	movzbl (%eax),%eax
  102e37:	0f be c0             	movsbl %al,%eax
  102e3a:	83 ec 08             	sub    $0x8,%esp
  102e3d:	ff 75 0c             	pushl  0xc(%ebp)
  102e40:	50                   	push   %eax
  102e41:	8b 45 08             	mov    0x8(%ebp),%eax
  102e44:	ff d0                	call   *%eax
  102e46:	83 c4 10             	add    $0x10,%esp
}
  102e49:	90                   	nop
  102e4a:	c9                   	leave  
  102e4b:	c3                   	ret    

00102e4c <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102e4c:	55                   	push   %ebp
  102e4d:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102e4f:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102e53:	7e 14                	jle    102e69 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102e55:	8b 45 08             	mov    0x8(%ebp),%eax
  102e58:	8b 00                	mov    (%eax),%eax
  102e5a:	8d 48 08             	lea    0x8(%eax),%ecx
  102e5d:	8b 55 08             	mov    0x8(%ebp),%edx
  102e60:	89 0a                	mov    %ecx,(%edx)
  102e62:	8b 50 04             	mov    0x4(%eax),%edx
  102e65:	8b 00                	mov    (%eax),%eax
  102e67:	eb 30                	jmp    102e99 <getuint+0x4d>
    }
    else if (lflag) {
  102e69:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102e6d:	74 16                	je     102e85 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102e6f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e72:	8b 00                	mov    (%eax),%eax
  102e74:	8d 48 04             	lea    0x4(%eax),%ecx
  102e77:	8b 55 08             	mov    0x8(%ebp),%edx
  102e7a:	89 0a                	mov    %ecx,(%edx)
  102e7c:	8b 00                	mov    (%eax),%eax
  102e7e:	ba 00 00 00 00       	mov    $0x0,%edx
  102e83:	eb 14                	jmp    102e99 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102e85:	8b 45 08             	mov    0x8(%ebp),%eax
  102e88:	8b 00                	mov    (%eax),%eax
  102e8a:	8d 48 04             	lea    0x4(%eax),%ecx
  102e8d:	8b 55 08             	mov    0x8(%ebp),%edx
  102e90:	89 0a                	mov    %ecx,(%edx)
  102e92:	8b 00                	mov    (%eax),%eax
  102e94:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102e99:	5d                   	pop    %ebp
  102e9a:	c3                   	ret    

00102e9b <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102e9b:	55                   	push   %ebp
  102e9c:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102e9e:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102ea2:	7e 14                	jle    102eb8 <getint+0x1d>
        return va_arg(*ap, long long);
  102ea4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ea7:	8b 00                	mov    (%eax),%eax
  102ea9:	8d 48 08             	lea    0x8(%eax),%ecx
  102eac:	8b 55 08             	mov    0x8(%ebp),%edx
  102eaf:	89 0a                	mov    %ecx,(%edx)
  102eb1:	8b 50 04             	mov    0x4(%eax),%edx
  102eb4:	8b 00                	mov    (%eax),%eax
  102eb6:	eb 28                	jmp    102ee0 <getint+0x45>
    }
    else if (lflag) {
  102eb8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102ebc:	74 12                	je     102ed0 <getint+0x35>
        return va_arg(*ap, long);
  102ebe:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec1:	8b 00                	mov    (%eax),%eax
  102ec3:	8d 48 04             	lea    0x4(%eax),%ecx
  102ec6:	8b 55 08             	mov    0x8(%ebp),%edx
  102ec9:	89 0a                	mov    %ecx,(%edx)
  102ecb:	8b 00                	mov    (%eax),%eax
  102ecd:	99                   	cltd   
  102ece:	eb 10                	jmp    102ee0 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102ed0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed3:	8b 00                	mov    (%eax),%eax
  102ed5:	8d 48 04             	lea    0x4(%eax),%ecx
  102ed8:	8b 55 08             	mov    0x8(%ebp),%edx
  102edb:	89 0a                	mov    %ecx,(%edx)
  102edd:	8b 00                	mov    (%eax),%eax
  102edf:	99                   	cltd   
    }
}
  102ee0:	5d                   	pop    %ebp
  102ee1:	c3                   	ret    

00102ee2 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102ee2:	55                   	push   %ebp
  102ee3:	89 e5                	mov    %esp,%ebp
  102ee5:	83 ec 18             	sub    $0x18,%esp
    va_list ap;

    va_start(ap, fmt);
  102ee8:	8d 45 14             	lea    0x14(%ebp),%eax
  102eeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102eee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ef1:	50                   	push   %eax
  102ef2:	ff 75 10             	pushl  0x10(%ebp)
  102ef5:	ff 75 0c             	pushl  0xc(%ebp)
  102ef8:	ff 75 08             	pushl  0x8(%ebp)
  102efb:	e8 06 00 00 00       	call   102f06 <vprintfmt>
  102f00:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  102f03:	90                   	nop
  102f04:	c9                   	leave  
  102f05:	c3                   	ret    

00102f06 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102f06:	55                   	push   %ebp
  102f07:	89 e5                	mov    %esp,%ebp
  102f09:	56                   	push   %esi
  102f0a:	53                   	push   %ebx
  102f0b:	83 ec 20             	sub    $0x20,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f0e:	eb 17                	jmp    102f27 <vprintfmt+0x21>
            if (ch == '\0') {
  102f10:	85 db                	test   %ebx,%ebx
  102f12:	0f 84 8e 03 00 00    	je     1032a6 <vprintfmt+0x3a0>
                return;
            }
            putch(ch, putdat);
  102f18:	83 ec 08             	sub    $0x8,%esp
  102f1b:	ff 75 0c             	pushl  0xc(%ebp)
  102f1e:	53                   	push   %ebx
  102f1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f22:	ff d0                	call   *%eax
  102f24:	83 c4 10             	add    $0x10,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102f27:	8b 45 10             	mov    0x10(%ebp),%eax
  102f2a:	8d 50 01             	lea    0x1(%eax),%edx
  102f2d:	89 55 10             	mov    %edx,0x10(%ebp)
  102f30:	0f b6 00             	movzbl (%eax),%eax
  102f33:	0f b6 d8             	movzbl %al,%ebx
  102f36:	83 fb 25             	cmp    $0x25,%ebx
  102f39:	75 d5                	jne    102f10 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102f3b:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102f3f:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102f46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102f49:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102f4c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102f53:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102f56:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102f59:	8b 45 10             	mov    0x10(%ebp),%eax
  102f5c:	8d 50 01             	lea    0x1(%eax),%edx
  102f5f:	89 55 10             	mov    %edx,0x10(%ebp)
  102f62:	0f b6 00             	movzbl (%eax),%eax
  102f65:	0f b6 d8             	movzbl %al,%ebx
  102f68:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102f6b:	83 f8 55             	cmp    $0x55,%eax
  102f6e:	0f 87 05 03 00 00    	ja     103279 <vprintfmt+0x373>
  102f74:	8b 04 85 14 3b 10 00 	mov    0x103b14(,%eax,4),%eax
  102f7b:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102f7d:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102f81:	eb d6                	jmp    102f59 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102f83:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102f87:	eb d0                	jmp    102f59 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102f89:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102f90:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102f93:	89 d0                	mov    %edx,%eax
  102f95:	c1 e0 02             	shl    $0x2,%eax
  102f98:	01 d0                	add    %edx,%eax
  102f9a:	01 c0                	add    %eax,%eax
  102f9c:	01 d8                	add    %ebx,%eax
  102f9e:	83 e8 30             	sub    $0x30,%eax
  102fa1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102fa4:	8b 45 10             	mov    0x10(%ebp),%eax
  102fa7:	0f b6 00             	movzbl (%eax),%eax
  102faa:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102fad:	83 fb 2f             	cmp    $0x2f,%ebx
  102fb0:	7e 39                	jle    102feb <vprintfmt+0xe5>
  102fb2:	83 fb 39             	cmp    $0x39,%ebx
  102fb5:	7f 34                	jg     102feb <vprintfmt+0xe5>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102fb7:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102fbb:	eb d3                	jmp    102f90 <vprintfmt+0x8a>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102fbd:	8b 45 14             	mov    0x14(%ebp),%eax
  102fc0:	8d 50 04             	lea    0x4(%eax),%edx
  102fc3:	89 55 14             	mov    %edx,0x14(%ebp)
  102fc6:	8b 00                	mov    (%eax),%eax
  102fc8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102fcb:	eb 1f                	jmp    102fec <vprintfmt+0xe6>

        case '.':
            if (width < 0)
  102fcd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fd1:	79 86                	jns    102f59 <vprintfmt+0x53>
                width = 0;
  102fd3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102fda:	e9 7a ff ff ff       	jmp    102f59 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102fdf:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102fe6:	e9 6e ff ff ff       	jmp    102f59 <vprintfmt+0x53>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  102feb:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  102fec:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ff0:	0f 89 63 ff ff ff    	jns    102f59 <vprintfmt+0x53>
                width = precision, precision = -1;
  102ff6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ff9:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ffc:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103003:	e9 51 ff ff ff       	jmp    102f59 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103008:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  10300c:	e9 48 ff ff ff       	jmp    102f59 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103011:	8b 45 14             	mov    0x14(%ebp),%eax
  103014:	8d 50 04             	lea    0x4(%eax),%edx
  103017:	89 55 14             	mov    %edx,0x14(%ebp)
  10301a:	8b 00                	mov    (%eax),%eax
  10301c:	83 ec 08             	sub    $0x8,%esp
  10301f:	ff 75 0c             	pushl  0xc(%ebp)
  103022:	50                   	push   %eax
  103023:	8b 45 08             	mov    0x8(%ebp),%eax
  103026:	ff d0                	call   *%eax
  103028:	83 c4 10             	add    $0x10,%esp
            break;
  10302b:	e9 71 02 00 00       	jmp    1032a1 <vprintfmt+0x39b>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103030:	8b 45 14             	mov    0x14(%ebp),%eax
  103033:	8d 50 04             	lea    0x4(%eax),%edx
  103036:	89 55 14             	mov    %edx,0x14(%ebp)
  103039:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  10303b:	85 db                	test   %ebx,%ebx
  10303d:	79 02                	jns    103041 <vprintfmt+0x13b>
                err = -err;
  10303f:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103041:	83 fb 06             	cmp    $0x6,%ebx
  103044:	7f 0b                	jg     103051 <vprintfmt+0x14b>
  103046:	8b 34 9d d4 3a 10 00 	mov    0x103ad4(,%ebx,4),%esi
  10304d:	85 f6                	test   %esi,%esi
  10304f:	75 19                	jne    10306a <vprintfmt+0x164>
                printfmt(putch, putdat, "error %d", err);
  103051:	53                   	push   %ebx
  103052:	68 01 3b 10 00       	push   $0x103b01
  103057:	ff 75 0c             	pushl  0xc(%ebp)
  10305a:	ff 75 08             	pushl  0x8(%ebp)
  10305d:	e8 80 fe ff ff       	call   102ee2 <printfmt>
  103062:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103065:	e9 37 02 00 00       	jmp    1032a1 <vprintfmt+0x39b>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  10306a:	56                   	push   %esi
  10306b:	68 0a 3b 10 00       	push   $0x103b0a
  103070:	ff 75 0c             	pushl  0xc(%ebp)
  103073:	ff 75 08             	pushl  0x8(%ebp)
  103076:	e8 67 fe ff ff       	call   102ee2 <printfmt>
  10307b:	83 c4 10             	add    $0x10,%esp
            }
            break;
  10307e:	e9 1e 02 00 00       	jmp    1032a1 <vprintfmt+0x39b>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103083:	8b 45 14             	mov    0x14(%ebp),%eax
  103086:	8d 50 04             	lea    0x4(%eax),%edx
  103089:	89 55 14             	mov    %edx,0x14(%ebp)
  10308c:	8b 30                	mov    (%eax),%esi
  10308e:	85 f6                	test   %esi,%esi
  103090:	75 05                	jne    103097 <vprintfmt+0x191>
                p = "(null)";
  103092:	be 0d 3b 10 00       	mov    $0x103b0d,%esi
            }
            if (width > 0 && padc != '-') {
  103097:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10309b:	7e 76                	jle    103113 <vprintfmt+0x20d>
  10309d:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1030a1:	74 70                	je     103113 <vprintfmt+0x20d>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1030a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1030a6:	83 ec 08             	sub    $0x8,%esp
  1030a9:	50                   	push   %eax
  1030aa:	56                   	push   %esi
  1030ab:	e8 17 f8 ff ff       	call   1028c7 <strnlen>
  1030b0:	83 c4 10             	add    $0x10,%esp
  1030b3:	89 c2                	mov    %eax,%edx
  1030b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1030b8:	29 d0                	sub    %edx,%eax
  1030ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1030bd:	eb 17                	jmp    1030d6 <vprintfmt+0x1d0>
                    putch(padc, putdat);
  1030bf:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1030c3:	83 ec 08             	sub    $0x8,%esp
  1030c6:	ff 75 0c             	pushl  0xc(%ebp)
  1030c9:	50                   	push   %eax
  1030ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1030cd:	ff d0                	call   *%eax
  1030cf:	83 c4 10             	add    $0x10,%esp
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  1030d2:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1030d6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1030da:	7f e3                	jg     1030bf <vprintfmt+0x1b9>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1030dc:	eb 35                	jmp    103113 <vprintfmt+0x20d>
                if (altflag && (ch < ' ' || ch > '~')) {
  1030de:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1030e2:	74 1c                	je     103100 <vprintfmt+0x1fa>
  1030e4:	83 fb 1f             	cmp    $0x1f,%ebx
  1030e7:	7e 05                	jle    1030ee <vprintfmt+0x1e8>
  1030e9:	83 fb 7e             	cmp    $0x7e,%ebx
  1030ec:	7e 12                	jle    103100 <vprintfmt+0x1fa>
                    putch('?', putdat);
  1030ee:	83 ec 08             	sub    $0x8,%esp
  1030f1:	ff 75 0c             	pushl  0xc(%ebp)
  1030f4:	6a 3f                	push   $0x3f
  1030f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f9:	ff d0                	call   *%eax
  1030fb:	83 c4 10             	add    $0x10,%esp
  1030fe:	eb 0f                	jmp    10310f <vprintfmt+0x209>
                }
                else {
                    putch(ch, putdat);
  103100:	83 ec 08             	sub    $0x8,%esp
  103103:	ff 75 0c             	pushl  0xc(%ebp)
  103106:	53                   	push   %ebx
  103107:	8b 45 08             	mov    0x8(%ebp),%eax
  10310a:	ff d0                	call   *%eax
  10310c:	83 c4 10             	add    $0x10,%esp
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10310f:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103113:	89 f0                	mov    %esi,%eax
  103115:	8d 70 01             	lea    0x1(%eax),%esi
  103118:	0f b6 00             	movzbl (%eax),%eax
  10311b:	0f be d8             	movsbl %al,%ebx
  10311e:	85 db                	test   %ebx,%ebx
  103120:	74 26                	je     103148 <vprintfmt+0x242>
  103122:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103126:	78 b6                	js     1030de <vprintfmt+0x1d8>
  103128:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  10312c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103130:	79 ac                	jns    1030de <vprintfmt+0x1d8>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103132:	eb 14                	jmp    103148 <vprintfmt+0x242>
                putch(' ', putdat);
  103134:	83 ec 08             	sub    $0x8,%esp
  103137:	ff 75 0c             	pushl  0xc(%ebp)
  10313a:	6a 20                	push   $0x20
  10313c:	8b 45 08             	mov    0x8(%ebp),%eax
  10313f:	ff d0                	call   *%eax
  103141:	83 c4 10             	add    $0x10,%esp
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  103144:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103148:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10314c:	7f e6                	jg     103134 <vprintfmt+0x22e>
                putch(' ', putdat);
            }
            break;
  10314e:	e9 4e 01 00 00       	jmp    1032a1 <vprintfmt+0x39b>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103153:	83 ec 08             	sub    $0x8,%esp
  103156:	ff 75 e0             	pushl  -0x20(%ebp)
  103159:	8d 45 14             	lea    0x14(%ebp),%eax
  10315c:	50                   	push   %eax
  10315d:	e8 39 fd ff ff       	call   102e9b <getint>
  103162:	83 c4 10             	add    $0x10,%esp
  103165:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103168:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  10316b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10316e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103171:	85 d2                	test   %edx,%edx
  103173:	79 23                	jns    103198 <vprintfmt+0x292>
                putch('-', putdat);
  103175:	83 ec 08             	sub    $0x8,%esp
  103178:	ff 75 0c             	pushl  0xc(%ebp)
  10317b:	6a 2d                	push   $0x2d
  10317d:	8b 45 08             	mov    0x8(%ebp),%eax
  103180:	ff d0                	call   *%eax
  103182:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  103185:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103188:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10318b:	f7 d8                	neg    %eax
  10318d:	83 d2 00             	adc    $0x0,%edx
  103190:	f7 da                	neg    %edx
  103192:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103195:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103198:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10319f:	e9 9f 00 00 00       	jmp    103243 <vprintfmt+0x33d>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1031a4:	83 ec 08             	sub    $0x8,%esp
  1031a7:	ff 75 e0             	pushl  -0x20(%ebp)
  1031aa:	8d 45 14             	lea    0x14(%ebp),%eax
  1031ad:	50                   	push   %eax
  1031ae:	e8 99 fc ff ff       	call   102e4c <getuint>
  1031b3:	83 c4 10             	add    $0x10,%esp
  1031b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031b9:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1031bc:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1031c3:	eb 7e                	jmp    103243 <vprintfmt+0x33d>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1031c5:	83 ec 08             	sub    $0x8,%esp
  1031c8:	ff 75 e0             	pushl  -0x20(%ebp)
  1031cb:	8d 45 14             	lea    0x14(%ebp),%eax
  1031ce:	50                   	push   %eax
  1031cf:	e8 78 fc ff ff       	call   102e4c <getuint>
  1031d4:	83 c4 10             	add    $0x10,%esp
  1031d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031da:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1031dd:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1031e4:	eb 5d                	jmp    103243 <vprintfmt+0x33d>

        // pointer
        case 'p':
            putch('0', putdat);
  1031e6:	83 ec 08             	sub    $0x8,%esp
  1031e9:	ff 75 0c             	pushl  0xc(%ebp)
  1031ec:	6a 30                	push   $0x30
  1031ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f1:	ff d0                	call   *%eax
  1031f3:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  1031f6:	83 ec 08             	sub    $0x8,%esp
  1031f9:	ff 75 0c             	pushl  0xc(%ebp)
  1031fc:	6a 78                	push   $0x78
  1031fe:	8b 45 08             	mov    0x8(%ebp),%eax
  103201:	ff d0                	call   *%eax
  103203:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103206:	8b 45 14             	mov    0x14(%ebp),%eax
  103209:	8d 50 04             	lea    0x4(%eax),%edx
  10320c:	89 55 14             	mov    %edx,0x14(%ebp)
  10320f:	8b 00                	mov    (%eax),%eax
  103211:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103214:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10321b:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103222:	eb 1f                	jmp    103243 <vprintfmt+0x33d>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103224:	83 ec 08             	sub    $0x8,%esp
  103227:	ff 75 e0             	pushl  -0x20(%ebp)
  10322a:	8d 45 14             	lea    0x14(%ebp),%eax
  10322d:	50                   	push   %eax
  10322e:	e8 19 fc ff ff       	call   102e4c <getuint>
  103233:	83 c4 10             	add    $0x10,%esp
  103236:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103239:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10323c:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103243:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103247:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10324a:	83 ec 04             	sub    $0x4,%esp
  10324d:	52                   	push   %edx
  10324e:	ff 75 e8             	pushl  -0x18(%ebp)
  103251:	50                   	push   %eax
  103252:	ff 75 f4             	pushl  -0xc(%ebp)
  103255:	ff 75 f0             	pushl  -0x10(%ebp)
  103258:	ff 75 0c             	pushl  0xc(%ebp)
  10325b:	ff 75 08             	pushl  0x8(%ebp)
  10325e:	e8 f8 fa ff ff       	call   102d5b <printnum>
  103263:	83 c4 20             	add    $0x20,%esp
            break;
  103266:	eb 39                	jmp    1032a1 <vprintfmt+0x39b>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103268:	83 ec 08             	sub    $0x8,%esp
  10326b:	ff 75 0c             	pushl  0xc(%ebp)
  10326e:	53                   	push   %ebx
  10326f:	8b 45 08             	mov    0x8(%ebp),%eax
  103272:	ff d0                	call   *%eax
  103274:	83 c4 10             	add    $0x10,%esp
            break;
  103277:	eb 28                	jmp    1032a1 <vprintfmt+0x39b>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103279:	83 ec 08             	sub    $0x8,%esp
  10327c:	ff 75 0c             	pushl  0xc(%ebp)
  10327f:	6a 25                	push   $0x25
  103281:	8b 45 08             	mov    0x8(%ebp),%eax
  103284:	ff d0                	call   *%eax
  103286:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  103289:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10328d:	eb 04                	jmp    103293 <vprintfmt+0x38d>
  10328f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103293:	8b 45 10             	mov    0x10(%ebp),%eax
  103296:	83 e8 01             	sub    $0x1,%eax
  103299:	0f b6 00             	movzbl (%eax),%eax
  10329c:	3c 25                	cmp    $0x25,%al
  10329e:	75 ef                	jne    10328f <vprintfmt+0x389>
                /* do nothing */;
            break;
  1032a0:	90                   	nop
        }
    }
  1032a1:	e9 68 fc ff ff       	jmp    102f0e <vprintfmt+0x8>
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
            if (ch == '\0') {
                return;
  1032a6:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  1032a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1032aa:	5b                   	pop    %ebx
  1032ab:	5e                   	pop    %esi
  1032ac:	5d                   	pop    %ebp
  1032ad:	c3                   	ret    

001032ae <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1032ae:	55                   	push   %ebp
  1032af:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1032b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032b4:	8b 40 08             	mov    0x8(%eax),%eax
  1032b7:	8d 50 01             	lea    0x1(%eax),%edx
  1032ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032bd:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1032c0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c3:	8b 10                	mov    (%eax),%edx
  1032c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c8:	8b 40 04             	mov    0x4(%eax),%eax
  1032cb:	39 c2                	cmp    %eax,%edx
  1032cd:	73 12                	jae    1032e1 <sprintputch+0x33>
        *b->buf ++ = ch;
  1032cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032d2:	8b 00                	mov    (%eax),%eax
  1032d4:	8d 48 01             	lea    0x1(%eax),%ecx
  1032d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032da:	89 0a                	mov    %ecx,(%edx)
  1032dc:	8b 55 08             	mov    0x8(%ebp),%edx
  1032df:	88 10                	mov    %dl,(%eax)
    }
}
  1032e1:	90                   	nop
  1032e2:	5d                   	pop    %ebp
  1032e3:	c3                   	ret    

001032e4 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  1032e4:	55                   	push   %ebp
  1032e5:	89 e5                	mov    %esp,%ebp
  1032e7:	83 ec 18             	sub    $0x18,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  1032ea:	8d 45 14             	lea    0x14(%ebp),%eax
  1032ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  1032f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032f3:	50                   	push   %eax
  1032f4:	ff 75 10             	pushl  0x10(%ebp)
  1032f7:	ff 75 0c             	pushl  0xc(%ebp)
  1032fa:	ff 75 08             	pushl  0x8(%ebp)
  1032fd:	e8 0b 00 00 00       	call   10330d <vsnprintf>
  103302:	83 c4 10             	add    $0x10,%esp
  103305:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103308:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10330b:	c9                   	leave  
  10330c:	c3                   	ret    

0010330d <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10330d:	55                   	push   %ebp
  10330e:	89 e5                	mov    %esp,%ebp
  103310:	83 ec 18             	sub    $0x18,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103313:	8b 45 08             	mov    0x8(%ebp),%eax
  103316:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103319:	8b 45 0c             	mov    0xc(%ebp),%eax
  10331c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10331f:	8b 45 08             	mov    0x8(%ebp),%eax
  103322:	01 d0                	add    %edx,%eax
  103324:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103327:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10332e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103332:	74 0a                	je     10333e <vsnprintf+0x31>
  103334:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103337:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10333a:	39 c2                	cmp    %eax,%edx
  10333c:	76 07                	jbe    103345 <vsnprintf+0x38>
        return -E_INVAL;
  10333e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103343:	eb 20                	jmp    103365 <vsnprintf+0x58>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103345:	ff 75 14             	pushl  0x14(%ebp)
  103348:	ff 75 10             	pushl  0x10(%ebp)
  10334b:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10334e:	50                   	push   %eax
  10334f:	68 ae 32 10 00       	push   $0x1032ae
  103354:	e8 ad fb ff ff       	call   102f06 <vprintfmt>
  103359:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  10335c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10335f:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103362:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103365:	c9                   	leave  
  103366:	c3                   	ret    

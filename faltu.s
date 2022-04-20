	.file	"faltu.c"
	.text
	.section	.rodata
.LC0:
	.string	"child: %p: %3d %c\n"
.LC1:
	.string	"parent: %p: %3d %c\n"
	.text
	.globl	test1
	.type	test1, @function
test1:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$8031924123371070824, %rax
	movabsq	$8247349193352703090, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movabsq	$7453010373645639777, %rax
	movq	%rax, -32(%rbp)
	movl	$0, -24(%rbp)
	movw	$0, -20(%rbp)
	call	fork@PLT
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jne	.L2
	movb	$102, -48(%rbp)
	movzbl	-48(%rbp), %eax
	movsbl	%al, %ecx
	movzbl	-48(%rbp), %eax
	movsbl	%al, %edx
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L5
.L2:
	movl	$1, %edi
	call	sleep@PLT
	movzbl	-48(%rbp), %eax
	movsbl	%al, %ecx
	movzbl	-48(%rbp), %eax
	movsbl	%al, %edx
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L5:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	test1, .-test1
	.section	.rodata
.LC2:
	.string	"dest: %p\n"
.LC3:
	.string	"%p: %3d %c\n"
.LC4:
	.string	"\n"
	.text
	.globl	test2
	.type	test2, @function
test2:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$8031924123371070824, %rax
	movabsq	$8247349193352703090, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movabsq	$7453010373645639777, %rax
	movq	%rax, -32(%rbp)
	movl	$0, -24(%rbp)
	movw	$0, -20(%rbp)
	leaq	-48(%rbp), %rdx
	leaq	-58(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-58(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -76(%rbp)
	jmp	.L7
.L8:
	movl	-76(%rbp), %eax
	cltq
	movzbl	-58(%rbp,%rax), %eax
	movsbl	%al, %edx
	movl	-76(%rbp), %eax
	cltq
	movzbl	-58(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	-76(%rbp), %ecx
	movslq	%ecx, %rcx
	leaq	-58(%rbp), %rsi
	addq	%rcx, %rsi
	movl	%edx, %ecx
	movl	%eax, %edx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -76(%rbp)
.L7:
	cmpl	$9, -76(%rbp)
	jle	.L8
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	test2, .-test2
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	test2
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits

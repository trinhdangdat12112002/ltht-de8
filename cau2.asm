INCLUDE LIB1.ASM
.MODEL small
.STACK 100h
.DATA
        tieuDe   db 13, 10, 'TRUNG BINH CONG HAI SO NGUYEN'
                 db 13, 10, '-------------------------------$'
        nhapSo1  db 13, 10, 'Hay vao so thu nhat: $'
        nhapSo2  db 13, 10, 'Hay vao so thu hai: $'
        ketQua   db 13, 10, 'TBC hai so nguyen la: $'
        dauAm    db '-$'
        phay     db '.5$'
        mTiepTuc db 13,10,'Co tiep tuc chuong trinh (c/k)? $'
.CODE
    PUBLIC _CAU2
    _CAU2 PROC  
        MAIN:   
                mov        ax, @data
                mov        ds, ax

                CLRSCR
                HienString tieuDe

                HienString nhapSo1
                call       VAO_SO_N
                mov        bx, ax

                HienString nhapSo2
                call       VAO_SO_N

                HienString ketQua
          
                xor        dx, dx
                add        ax, bx


                cmp        ax, 0
                jge        DUONG
                neg        ax
                HienString dauAm
 
        DUONG:  
                mov        bx, 2
                idiv       bx

        HienKQ: 
                call       HIEN_SO_N

                cmp        dx, 0
                je         TiepTuc
                HienString phay

        TiepTuc:
                HienString mTiepTuc
                mov        ah, 01h
                int        21h
                cmp        al,'c'
                jne        Exit
                jmp        MAIN

        Exit:  
                ret 
                INCLUDE    LIB2.ASM
                INCLUDE    LIB3.ASM
    _CAU2 ENDP
END
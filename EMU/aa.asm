INCLUDE LIB1.ASM
.MODEL small
.STACK 100h
.DATA
        tieuDe   db 13, 10, 'TRUNG BINH CONG HAI SO NGUYEN'
                 db 13, 10, '-------------------------------$'
        nhapSo1  db 13, 10, 'Hay vao so thu nhat: $'
        nhapSo2  db 13, 10, 'Hay vao so thu hai: $'
        ketQua   db 13, 10, 'TBC hai so nguyen la: $'   
        dauam     db '-$'
        phay     db '.5$'
        mTiepTuc db 13,10,'Co tiep tuc chuong trinh (c/k)? $'
.CODE
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
          
                xor        dx, dx
                add        ax, bx
                HienString ketQua
                cmp        ax, 0
                jge        DUONG
                neg        ax 
                HienString dauam 

        DUONG:  
                shr ax,1 

                jc LE
                   
        CHAN: 
              
                call       HIEN_SO_N
                jmp TiepTuc
        LE:    
               
                call       HIEN_SO_N   
                HienString phay 

        TiepTuc:
                HienString mTiepTuc
                mov        ah, 01h
                int        21h
                cmp        al,'c'
                jne        Exit
                jmp        MAIN

        Exit:   
                mov        ah, 4ch
                int        21h
                INCLUDE    LIB2.ASM
                INCLUDE    LIB3.ASM
END MAIN
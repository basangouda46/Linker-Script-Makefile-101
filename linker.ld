
MEMORY{
    FLASH : ORIGIN = 0x20000000 LENGTH = 4K
}

SECTIONS{
    
    .text : {
        *(.text)
    } > FLASH

    .data : {
        *(.data)
    }

    .bss : {
        *.(.bss)
    }
}
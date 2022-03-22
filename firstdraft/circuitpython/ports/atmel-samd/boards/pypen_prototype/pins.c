#include "shared-bindings/board/__init__.h"

STATIC const mp_rom_map_elem_t board_module_globals_table[] = {
    CIRCUITPYTHON_BOARD_DICT_STANDARD_ITEMS

    { MP_ROM_QSTR(MP_QSTR_BTN_ALARM), MP_ROM_PTR(&pin_PA03) },
    { MP_ROM_QSTR(MP_QSTR_BTN_LIGHT), MP_ROM_PTR(&pin_PA16) },
    { MP_ROM_QSTR(MP_QSTR_BTN_MODE), MP_ROM_PTR(&pin_PA17) },
    { MP_ROM_QSTR(MP_QSTR_VREG), MP_ROM_PTR(&pin_PA15) },
    { MP_ROM_QSTR(MP_QSTR_DISPLAY_CS),  MP_ROM_PTR(&pin_PA04) },
    { MP_ROM_QSTR(MP_QSTR_DISPLAY_ENABLE),  MP_ROM_PTR(&pin_PA05) },
    { MP_ROM_QSTR(MP_QSTR_DISPLAY_EXTCOMIN),  MP_ROM_PTR(&pin_PB02) },
    { MP_ROM_QSTR(MP_QSTR_SCK),  MP_ROM_PTR(&pin_PB09) },
    { MP_ROM_QSTR(MP_QSTR_MOSI), MP_ROM_PTR(&pin_PB08) },
    { MP_ROM_QSTR(MP_QSTR_MISO), MP_ROM_PTR(&pin_PB10) },
    { MP_ROM_QSTR(MP_QSTR_SPI), MP_ROM_PTR(&board_spi_obj) },
};
MP_DEFINE_CONST_DICT(board_module_globals, board_module_globals_table);

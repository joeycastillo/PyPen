#define MICROPY_HW_BOARD_NAME "PyPen Prototype"
#define MICROPY_HW_MCU_NAME "samd21g18"

#define MICROPY_HW_LED_STATUS   (&pin_PA17)

#define SPI_FLASH_BAUDRATE  (8000000)

#define SPI_FLASH_MOSI_PIN          &pin_PA22
#define SPI_FLASH_MISO_PIN          &pin_PA20
#define SPI_FLASH_SCK_PIN           &pin_PA23
#define SPI_FLASH_CS_PIN            &pin_PA21

#define BOARD_HAS_CRYSTAL 0

#define DEFAULT_SPI_BUS_SCK (&pin_PB09)
#define DEFAULT_SPI_BUS_MOSI (&pin_PB08)
#define DEFAULT_SPI_BUS_MISO (&pin_PB10)

// These pins are connected to the external crystal.
#define IGNORE_PIN_PA00     1
#define IGNORE_PIN_PA01     1

// USB is always used internally so skip the pin objects for it.
#define IGNORE_PIN_PA24     1
#define IGNORE_PIN_PA25     1

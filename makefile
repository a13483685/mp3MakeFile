.PHONY:all clean

all:
	make -C lcd
	make -C usb
	make -C media
	make -C app

clean:
	rm -rf app/player.d app/link_obj/*.o app/mp3
	rm -rf usb/usb.d usb/usb.o
	rm -rf media/media.o media/media.d
	rm -rf lcd/lcd.o lcd/lcd.d

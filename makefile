.PHONY:all clean

all:
	make -C lcd
	make -C usb
	make -C media
	make -C app

clean:
	rm -rf app/dep/*.d app/link_obj/*.o
	rm -rf mp3

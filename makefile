# Make CAR library

L = car
LIBR = ./$(L).so
MSG = "Build CAR library"

CC = cc
CFLAG = -pie -fPIC -c
# SFLAG = -fno-stack-limit -fstack-usage
SFLAG =
LFLAG = -pie -fPIC -shared -o
LIL = ld
OBJ_DIR = ./obj/
SRC_DIR = ./obj/src/
HDR_DIR = ./obj/src/incl/
HDRS = $(HDR_DIR)*.h
SRCS = $(SRC_DIR)*.c
OBJS = $(OBJ_DIR)*.o
OBJ = ./*.o

$(LIBR): $(SRCS) $(HDRS)
	@echo $(MSG)
	$(CC) $(SFLAG) $(CFLAG) $(SRCS)
	$(LIL) $(LFLAG) $(LIBR) $(OBJ)

.PHONY: _arrange _copy_obj _clean_obj
_arrange: _copy_obj _clean_obj
_copy_obj:
#	cp -v ./*.o ./obj/
	cp -v $(OBJ) $(OBJ_DIR)
_clean_obj:
#	rm -v ./*.o
	rm -v $(OBJ)

.PHONY: _clean_all _clean_copied_obj
_clean_all: _clean_copied_obj
#	rm -v ./$(L).so
	rm -v $(LIBR)
_clean_copied_obj:
#	rm -v ./obj/*.o
	rm -v $(OBJ_DIR)*.o

# and more..

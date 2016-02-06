MAKE = make
CC = g++
AR = ar
CFLAG = -O -Wall
LDFLAGS =
INCLUDES = -IAdapter -IObsrever -ISingleton -IChainOfResponsibility
LIBS = -lm
TARGET = a.exe
SUBS = Adapter/adapter.a Observer/observer.a Singleton/singleton.a ChainOfResponsibility/chainOfResponsibility.a
SUBDIRS = Adapter Observer Singleton ChainOfResponsibility
SRCS = main.cpp
OBJS = $(SRCS:.cpp=.o)
#OBJS = *.o

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<
.cpp.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<


all: sub_target $(TARGET)

.PHONY: sub_target
sub_target:
	@for subdir in $(SUBDIRS) ; do \
		(cd $$subdir && $(MAKE)) ;\
	done

$(TARGET): $(OBJS) $(SUBS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(SUBS) $(LIBS)

.PHONY: clean
clean:
	rm -f *.o *.a *.exe
	@for subdir in $(SUBDIRS) ; do \
		(cd $$subdir && $(MAKE) clean) ;\
	done


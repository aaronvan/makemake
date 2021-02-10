# in case the SHELL variable is not set or inherited
SHELL = /bin/bash

# clear/set suffix list
.SUFFIXES:
.SUFFIXES: .c .h .o

CC		= gcc
BINDIR	= bin
OBJDIR	= obj
SRCDIR	= src
MKDIR	= mkdir -pv
RM		= rm -rfv
VERIFY	= cat -e -t -v Makefile

SRC     = $(wildcard $(SRCDIR)/*.c)
OBJS    = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRC))

CFLAGS 	= -Wall -g -std=c17 -pedantic -Iinclude -Werror -DNDEBUG

# executable
_BIN = a.out
BIN  = $(addprefix $(BINDIR)/, $(_BIN))

# default
.PHONY: all
all: $(BINDIR) $(OBJDIR) $(BIN)

#linking
$(BIN): $(OBJS) $(BINDIR)
	$(CC) -o $@ $(CFLAGS) $(OBJS)

$(BINDIR):
	$(MKDIR) $(BINDIR)

# compiling
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	$(MKDIR) $(OBJDIR)

.PHONY: clean
clean:
	@echo "Cleaning things up..."
	$(RM) $(OBJDIR) $(BINDIR)

.PHONY: verify
verify:
	$(VERIFY)

# macro review
print-%:
	@echo $* = $($*)

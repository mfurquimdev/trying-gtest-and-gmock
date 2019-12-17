#-------------------------------------------------------------------------------
# Estrutura do projeto
# .
# ├── Makefile
# ├── obj
# └── src
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Nome do projeto
# https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile
#-------------------------------------------------------------------------------
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
NAME := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

#-------------------------------------------------------------------------------
# Diretórios
#-------------------------------------------------------------------------------
SRC_DIR=.
OBJ_DIR=./obj
INC_DIR=.
BIN_DIR=.

#-------------------------------------------------------------------------------
# C, Header, Object and Mapping Files
#-------------------------------------------------------------------------------
SRC = ${wildcard $(SRC_DIR)/*.cpp}
OBJ = ${addprefix $(OBJ_DIR)/, ${notdir ${SRC:.cpp=.o}}}
INC = -I$(INC_DIR)

#-------------------------------------------------------------------------------
# Compilador, flags e bibliotecas
#-------------------------------------------------------------------------------
CC=g++
CFLAGS= -Wall -Wextra -pedantic -ansi -std=c++11
LFLAGS= -lgtest -lgtest_main -lgmock 

TARGET=$(BIN_DIR)/$(NAME)

.PHONY: clean all dirs

all: dirs
	@echo
	@echo Compiling...
	$(MAKE) $(TARGET)

dirs:
	@mkdir -vp $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo
	@echo Building $@
	$(CC) -c $^ -o $@ $(CFLAGS) $(INC)

$(TARGET): $(OBJ)
	@echo
	@echo Linking $@
	$(CC) -o $@ $(OBJ) $(LIB) $(LFLAGS)

clean:
	@echo Cleaning...
	rm -rvf $(OBJ_DIR) $(TARGET)

.PRECIOUS: %.o

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
SRC_DIR=./src
OBJ_DIR=./obj
INC_DIR=./inc
BIN_DIR=./bin
TEST_DIR=./test

#-------------------------------------------------------------------------------
# C, Header, Object and Mapping Files
#-------------------------------------------------------------------------------
SRC = ${wildcard $(SRC_DIR)/*.cpp}
SRC+= ${wildcard $(TEST_DIR)/*.cpp}
OBJ = ${addprefix $(OBJ_DIR)/, ${notdir ${SRC:.cpp=.o}}}
INC = -I$(INC_DIR)

#-------------------------------------------------------------------------------
# Compilador, flags e bibliotecas
#-------------------------------------------------------------------------------
CC=g++
CFLAGS= -Wall -Wextra -pedantic -ansi -std=c++11
LFLAGS= -lgtest -lgtest_main -lgmock 

TARGET=$(BIN_DIR)/$(NAME)

.PHONY: clean all dirs run

all: dirs
	@echo
	@echo Compiling...
	$(MAKE) $(TARGET)
	$(MAKE) run

dirs:
	@mkdir -vp $(OBJ_DIR)
	@mkdir -vp $(BIN_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo
	@echo Building $@
	$(CC) -c $^ -o $@ $(CFLAGS) $(INC)

$(OBJ_DIR)/%.o: $(TEST_DIR)/%.cpp
	@echo
	@echo Building $@
	$(CC) -c $^ -o $@ $(CFLAGS) $(INC)

$(TARGET): $(OBJ)
	@echo
	@echo Linking $@
	$(CC) -o $@ $(OBJ) $(LIB) $(LFLAGS)

run:
	$(TARGET) --gtest_color=yes --gtest_repeat=1 --gtest_shuffle --gtest_print_time=0

disabled:
	$(TARGET) --gtest_also_run_disabled_tests

clean:
	@echo Cleaning...
	rm -rvf $(OBJ_DIR) $(BIN_DIR)

.PRECIOUS: %.o

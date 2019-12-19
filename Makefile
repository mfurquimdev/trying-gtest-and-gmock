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
MAIN_SRC_DIR=./main/src
MAIN_INC_DIR=./main/inc
MAIN_OBJ_DIR=./main/obj

TEST_SRC_DIR=./test/src
TEST_INC_DIR=./test/inc
TEST_OBJ_DIR=./test/obj

BIN_DIR=./bin

#-------------------------------------------------------------------------------
# C, Header, Object and Mapping Files
#-------------------------------------------------------------------------------
SRC_MAIN = ${wildcard $(MAIN_SRC_DIR)/*.cpp}
SRC_TEST = ${wildcard $(TEST_SRC_DIR)/*.cpp}

OBJ_MAIN = ${addprefix $(MAIN_OBJ_DIR)/, ${notdir ${SRC_MAIN:.cpp=.o}}}
OBJ_TEST = ${addprefix $(TEST_OBJ_DIR)/, ${notdir ${SRC_TEST:.cpp=.o}}}

INC_MAIN = -I$(MAIN_INC_DIR)
INC_TEST = -I$(TEST_INC_DIR)

#-------------------------------------------------------------------------------
# Compilador, flags e bibliotecas
#-------------------------------------------------------------------------------
CC=g++
CFLAGS= -Wall -Wextra -pedantic -ansi -std=c++11
LFLAGS= -lgtest -lgtest_main -lgmock 

MAIN_TARGET=$(BIN_DIR)/$(NAME)
TEST_TARGET=$(BIN_DIR)/$(NAME)_test

.PHONY: clean all dirs run

main: main_dirs
	@echo
	@echo Compiling...
	$(MAKE) $(MAIN_TARGET)

main_dirs:
	@mkdir -vp $(BIN_DIR)
	@mkdir -vp $(MAIN_OBJ_DIR)




test: test_dirs
	@echo
	@echo Compiling Test...
	$(MAKE) $(TEST_TARGET)
	$(MAKE) run_test

test_dirs: main_dirs
	@mkdir -vp $(TEST_OBJ_DIR)

$(OBJ_DIR)/%.o: $(MAIN_DIR)$(SRC_DIR)/%.cpp
	@echo
	@echo Building $@
	$(CC) -c $^ -o $@ $(CFLAGS) $(INC)

$(OBJ_DIR)/%.o: $(TEST_DIR)$(SRC_DIR/%.cpp
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

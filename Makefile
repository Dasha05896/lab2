CXX = g++
CXXFLAGS = -Wall -Werror -std=c++11
TARGET = myprogram

all: $(TARGET)

$(TARGET): main.cpp
	$(CXX) $(CXXFLAGS) -o $(TARGET) main.cpp

clean:
	rm -f $(TARGET)

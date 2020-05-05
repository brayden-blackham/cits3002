# cits3002
## Lab 1

The file Q1.datafile (save this file directly to disk; it may confuse your browser) contains the output of the following C code:
#include <fcntl.h>
#include <stdint.h>
#include <unistd.h>
.....
    int  fd = open("Q1.datafile", O_CREAT|O_WRONLY, 0600);

    if(fd >= 0) {        //  IFF FILE OPENED SUCCESSFULLY
        for(int32_t i = -50 ; i<50 ; i++) {
            write(fd, &i, sizeof(i));
        }
        close(fd);
    }
when compiled and executed on a Sun SPARC computer (of which our Department used to own a great number, but now almost exclusively relies on Intel 64-bit x86 processors).
Note that the integers have been written as "raw" binary values, not their text equivalents as would be produced by C's printf() function, or Java's toString methods.
Write a short program (on any operating system platform in our Department's labs) to read in the 100 integers and display them to the screen.
What do you observe and why?
Does the Linux or macOS program named od offer any help (run man od)?
What consequences do your observations have for computer networking?
Examine C implementations of the three industry-standard cyclic-redundancy check (CRC) algorithms discussed in Lecture-2:
  checksum_ccitt(),   checksum_crc16(), and   checksum_internet()
Each of these functions accepts two parameters: an array of characters or bytes (as if the bytes were a network frame about to be transmitted, or just received), and an integer indicating how many bytes are provided in the array. Each of the functions then produces an integer result that is the result of calculating a checksum value of all bytes in the array. Each checksum algorithm is different and 'combines together' all bits from all bytes.
There is no need to understand the implementations (doing so is very difficult), and each may be treated just as a "black-box", receiving inputs and producing an output.
We can generate frames of random, ficticious data with code such as:

#define FRAMESIZE  200

typedef unsigned char    byte;

byte    frame[FRAMESIZE];

//  SEED THE RANDOM NUMBER GENERATOR (TO PRODUCE DIFFERENT RESULT, EACH TIME)
    srand( getpid() );

//  POPULATE THE FRAME WITH RANDOM BYTES
    for(int i=0 ; i < FRAMESIZE ; ++i) {
        frame[i] = rand() % 256;
    }
Using the simple function corrupt_frame(), and some of its suggested modifications, write a program to demonstrate that these CRC algorithms are very robust.
Think before coding (always a good technique!) and consider the questions:
what do CRC algorithms (in general) aim to do?
what is the purpose/use of the result of a CRC algorithm?
what does it mean to describe a CRC algorithm as robust?
what should I try to measure?
what will be considered a success, and what a failure?
how will I report my results?
Extending your tests of Q2, how successful is a (naive) checksum function which simply adds up all bytes in a buffer to be transmitted? Why, or why not, might such a function be successful?
In Q2 you tested the checksum algorithms with some randomly generated blocks (frames) of data. There may be concerns that just using random data, rather than data more typically observed in real networks, has produced skewed results.
Modify your solution to Q2 to now use data from (the contents of) a large file from your computer's disk - as if that file were being copied across a network.
The Unix system call gettimeofday() may be used to measure the execution time of sections of your code. Using gettimeofday(), is any of the three given CRC algorithms significantly faster than the others? This simple timing program may help.
How important a factor do you think is speed in choosing a suitable CRC algorithm?

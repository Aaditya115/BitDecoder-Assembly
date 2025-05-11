//BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE TENURES OF
//THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. THIS IS THE README FILE FOR LAB
//6.

#include <stdio.h>
unsigned char rotate_right(unsigned char value);
unsigned char rotate_left(unsigned char value);
unsigned int create_key();
int main()
{
unsigned char cur_in;
unsigned int key;
int count = 0;
key = create_key();
unsigned int temp_key = key;
printf("enter encoded text: ");
while ( (scanf("%hhX",&cur_in) > 0))
{
if(count %2){
cur_in = (unsigned int)rotate_left(cur_in);
}
else {
cur_in = (unsigned int)rotate_right(cur_in);
}
count++;
cur_in = cur_in ^ temp_key;
putchar(cur_in);
cur_in = getchar();
if(cur_in == '\n') break;
}
putchar('\n');
return(0);
}


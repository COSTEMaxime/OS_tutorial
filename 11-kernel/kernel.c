void main() {
    //Create a pointer and point it to the first cell of the video memory
    char* video_memory = (char*) 0xb8000;
    //Store the character 'X' at the address pointed by our pointer
    *video_memory = 'X';
} 

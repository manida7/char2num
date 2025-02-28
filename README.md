# Task: Character to Number Conversion in Assembly

In this task, you will extend the provided **x86_64 Assembly** code to complete two main objectives: character validation and conversion of an ASCII character to its corresponding numeric value.

## Objective

### 1. Character Validation

You will check if the input character is a valid digit (between ASCII values 48 and 57, representing the characters `'0'` to `'9'`), and print an appropriate message.

- **If the character is not a digit**, print the following error message:

```plaintext
not a number, pass digit character to stdin
```

- **If the character is a digit**, print the message:

```plaintext
got number!
```

You can use the predefined strings `not_number` and `number` that are already provided in the code.

### 2. Character to Number Conversion

Once you have validated that the input character is a digit, you will convert the ASCII character into its corresponding numeric value.

- Subtract `48` from the ASCII value of the character to convert it into an integer (`'0'` becomes `0`, `'1'` becomes `1`, etc.).
- Pass the resulting numeric value to the `printf` function (from the C standard library) and print the integer.

The `printf` function is already set up for you. You will replace the constant `$42` in the following line with the converted number:

```assembly
mov  $42, %rsi
```

Afterward, `printf` will output the correct integer.

---

## Code Structure Overview

The code is structured as follows:
- **.bss**: Declares the uninitialized variable `arr`, where the input character will be stored.
- **.rodata**: Stores read-only data such as strings for formatted output (`fmt`, `eol`, `not_number`, `number`).
- **.text**: Contains the main logic of the program, including reading input, error handling, and conversion logic.

### Key Sections

1. **Input Reading**: The program reads one byte from `stdin` and stores it in `arr`.
2. **Character Validation**: The code checks if the input is within the ASCII range for digits (`48-57`).
3. **Error Handling**: If the input is not a valid digit, an error message is printed, and the program exits.
4. **Printing**: The program prints the input character and a newline.
5. **Conversion**: The valid digit is converted to its corresponding integer, and the integer is printed using `printf`.

---

## Example Scenarios

### Input: Valid Digit

```bash
echo "5" | ./char2num
```

**Expected Output**:
```plaintext
got number!
```

### Input: Invalid Character

```bash
echo "+" | ./char2num
```

**Expected Output**:
```plaintext
not a number, pass digit character to stdin
```
---

// Christian Marquardt
// 2/19/2018
// CSCI 305 Lab3
// Overview: Calling in a text file and parsing out the numbers
// and then write that to a file

package main

import (
	"io/ioutil"
	"strings"
	"fmt"
	"os"
)

//Our checking function that will be called in other functions
func check(e error) {
    if e != nil {
        panic(e)
    }
}

//Here we are reading in a file called "input.txt"
//Call in as a string then split it so we can do our changes later
func readInput() []string {
	b, err := ioutil.ReadFile("input.txt")

	if err != nil{
		check(err)
	}

	str := string(b)
	str1 := strings.Split(str, "")

	return str1
}

//Call in a split array string and at each spot we will search for an int 0-9
//From there we will replace it with a "" then search for letters and store them
//into a result array string so there is one less space in between them
//Also I do  not believe I need a check because we will have had an error already
func parseNum(str1 []string) string {
	for i := range str1{
		if str1[i] == "0"{
			str1[i] = strings.Replace(str1[i], "0", "", 1)
		}

		if str1[i] == "1"{
                        str1[i] = strings.Replace(str1[i], "1", "", 1)
                }

		if str1[i] == "2"{
                        str1[i] = strings.Replace(str1[i], "2", "", 1)
                }

		if str1[i] == "3"{
                        str1[i] = strings.Replace(str1[i], "3", "", 1)
                }

		if str1[i] == "4"{
                        str1[i] = strings.Replace(str1[i], "4", "", 1)
                }

		if str1[i] == "5"{
                        str1[i] = strings.Replace(str1[i], "5", "", 1)
                }

		if str1[i] == "6"{
                        str1[i] = strings.Replace(str1[i], "6", "", 1)
                }

		if str1[i] == "7"{
                        str1[i] = strings.Replace(str1[i], "7", "", 1)
                }

		if str1[i] == "8"{
                        str1[i] = strings.Replace(str1[i], "8", "", 1)
                }

		if str1[i] == "9"{
                        str1[i] = strings.Replace(str1[i], "9", "", 1)
                }
	}

//Eliminate the spaces
newString := []string{}
var e int = 0
	for i := range str1{
		if (str1[i] != ""){
			newString = append(newString, str1[i])
			e++
		}
	}
result := strings.Join(newString, "")
fmt.Println(result)
return result
}

//Converted to a string, we will write to that file
func writeFile(result string){
	ou, err := os.Create("output.txt")
	if err != nil{
	check(err)
	}
	defer ou.Close()

	fmt.Fprintln(ou, result)
}


//Our main to call all of the methods
func main(){
      str1:= readInput()
      result := parseNum(str1)
      writeFile(result)
}



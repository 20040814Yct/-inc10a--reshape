---
title: "PS3"
output: html_document
date: "2023-10-27"
---

1.1 Find files in folder
1. What is the current working directory of the R instance that is compiling your homework
document? Use R to find it.
```{r}
getwd()
```


#2. What is the folder (absolute path) of the rmarkdown document you use for your current
#homework?
"/Users/tonyy/desktop/Tony stuff/INFO201"


 # 3. Now create a folder on your Desktop where you put
#• At least 3 pdf files
#• At least 3 image files
#• At least 3 other files
#How did you call that folder? What is the relative path of that folder with respect to the
#working directory (in Q 1)?


```{r}
"~/Desktop/"
```

 
# 4. Include a screenshot of the folder (in a file explorer) into this document as image. Use the
#markdown tools to include the image!
#  Note: if your group is using different computers to answer the other questions below, then
#please include the screenshot for all the computers you use!

```{r}
library(magick)
jietu <- "/Users//写自己的路径/"

img <- image_read()

plot(img)

```



#  5. Now use the relative path you wrote in Q 3 to list all files from within R. Store the list of files into a variable, but also print it!
```{r}
path <- "~/Desktop/写自己的路径"
files <- list.files(path)
cat("list of files:\n")
print(files)

```


#  6. Do you see the same files as in the image?

```{r}
"yes"
```

# 7. Do you see the complete file name in the file explorer image?
```{r}
"yes"
```


# 1.2 Work with the files
#1. Now write a loop that walks over all the files your found above. In the loop:
#  • Add the relative path of the folder to it
#• If the file is an image (file name ends with jpg/png/heic), then load it and plot using
#plot(). Print the file name above the plot!
# • If the file is a pdf (file name ends with .pdf), then load the 2nd page of if and plot. Print
#the file name underneath the plot
#• If the image is something else, then print its name with a remark like “cannot be dis- played”

```{r}
library(magick)
library(png)
library(jpeg)
library(pdftools)

for(file in files) {
  file_path <- paste0("~/Desktop/写自己的路径/", file)
  
  if(grepl("\\.(jpg|png)$", file)) {
    if(grepl("\\.jpg$", file)) {
      img <- image_read(file_path)
      plot(img)
    } else if(grepl("\\.png$", file)) {
      img <- image_read(file_path)
      plot(img)
    }
  } else if(grepl("\\.pdf$", file)) {
    page <- image_read_pdf(file_path, pages = 2)
    page <- image_resize(page, "500x")
    plot(page)
  } else {
    cat(file, "cannot be displayed\n")
  }
}

```


#2 Control structures
#1. Take the vector of file names in your sample folder you created above. Transform each file
name into a sentence where you tell the file type for each file. The output should look like:
 
 
```{r}
path <- "~/Desktop/写自己的路径"
files <- list.files(path)
file_ext <- tools::file_ext(files)

sentences <- ifelse(file_ext == "jpg", paste(files, "is an image file"),
              ifelse(file_ext == "pdf", paste(files, "is a pdf file"), 
                     paste(files, "is something else")))
print(sentences)
```


 

2Do you have any .png files included? Compute the number of png files, and print the corre-
sponding sentence. Depending on the number of png files, you should print either:
There are no png files
or
There is a single png file
or
There is n png files
where n is the number of png files!
```{r}
path <- "~/Desktop/写自己的路径"
files <- list.files(path)

ile_ext <- tools::file_ext(files)

num_png <- sum(file_ext == "png")

if (num_png == 0) {
  print("There are no png files")
} else if (num_png == 1) {
  print("There is a single png file")
} else {
  print(paste("There are", num_png, "png files"))
}
```

3.1 Markdown
1. Use markdown second level header for the title of the main question, and third level header
for the subquestion

## main question 

### subquestion 

2. Use markdown fourth level headers for each numbered item.

#### 1.Item one
#### 2.Item two
#### 3.Item three

3. Create a bullet list of (at least 3) colors

```{r}
cat("*写自己的")
cat("写自己的")
cat("*写自己的")

```


4. Create a numbered list of (at least 3) cities.
```{r}
cat("1.写自己的")
cat("2写自己的")
cat("3.写自己的")
```



5. Create a pre-formatted text (at least 3 lines)
```{r}
cat("写自己的")
cat("写自己的")
cat("写自己的") 
```


 

6. Write a sentence that includes both bold and italic text.


**bold** 
_italic_

7. Include an image in the text using markdown
```{r}
library(magick)
image <- image_read("~/Desktop/写自己的/写自己的")
plot(image)
```



3.2 RMarkdown
1. Count the number of images, pdf-s and other files in the folder above.
```{R}
library(filesstrings)

path <- "~/Desktop/写自己的路径"
files <- list.files(path, recursive = TRUE)

file_exts <- tools::file_ext(files)

num_images <- sum(file_exts %in% c("jpg", "png"))

num_pdfs <- sum(file_exts == "pdf")

num_others <- length(files) - num_images - num_pdfs

cat("Number of image files: ", num_images, "\n")
cat("Number of PDF files: ", num_pdfs, "\n")
cat("Number of other files: ", num_others, "\n")



```


# Print the counts
cat("Number of images:", image_count, "\n")
cat("Number of PDFs:", pdf_count, "\n")
cat("Number of other files:", other_count, "\n")
```
Make sure to replace "path/to/your/folder" with the actual path to your folder. This code chunk will count the number of images (with extensions .jpg, .png, or .heic), PDFs, and other files in the specified folder based on the file extensions. Adjust the regular expressions according to the specific file formats you want to count.






```

2. Print a sentence like
There are n files in the folder name folder, n1 images, n2 pdfs, and n3 other files.
The numbers n, n1, n2 and n3 should be the counts that you computed above, and the folder
name should be the folder name. Folder name should be in italics, and the counts in bold!
Use inline markdown to print it, so that the text will look a seamless sentence.
if 

```{r}

library(filesstrings)

path <- "~/Desktop/写自己的路径"  
folder_name <- basename(path)  
files <- list.files(path, recursive = TRUE)

file_exts <- tools::file_ext(files)

num_files <- length(files)  
num_images <- sum(file_exts %in% c("jpg", "png"))  
num_pdfs <- sum(file_exts == "pdf") 
num_others <- num_files - num_images - num_pdfs  

```

There are **`r num_files`** files in the _`r folder_name`_ folder,  **`r num_images `** images, **`r num_pdfs `** pdfs, and  **`r num_others`** other files.
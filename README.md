# ckad-exam
ckad-exam


## 1. Concepts - 13%

### Question 1 : Create a namespace called "frontend".

<details><summary>show</summary>
<p>

```bash
kubectl create ns frontend --dry-run=client -o yaml > 1.1-ns.yaml
kubectl apply -f 1.1-namespace.yaml
```

```YAML
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: null
  name: frontend
spec: {}
status: {}
```
</p>
</details>


# This is an <h1> tag
## This is an <h2> tag
###### This is an <h6> tag


*This text will be italic*
_This will also be italic_

**This text will be bold**
__This will also be bold__

_You **can** combine them_

# List 
* Item 1
* Item 2
  * Item 2a
  * Item 2b

# Links	
http://github.com - automatic!
[GitHub](http://github.com)
	
# Task List	
- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item

# Tables 
First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column

## Strikethrough
Any word wrapped with two tildes (like ~~this~~) will appear crossed out.
	
## Emoji-cheat-sheet
https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md
	






## Generate SSH Key
ssh-keygen -t rsa -b 4096 -C "brijeshdhaker@gmail.com"

##

##
…or create a new repository on the command line
echo "# personal" >> README.md

git init

git add README.md

git commit -m "first commit"

git branch -M develop

git remote add origin git@github.com:brijeshdhaker/ckad-exam.git

git push -u origin develop
                

…or push an existing repository from the command line

git remote add origin git@github.com:brijeshdhaker/ckad-exam.git

git branch -M master

git push -u origin master
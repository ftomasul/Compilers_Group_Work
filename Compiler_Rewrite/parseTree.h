#include <iostream>
using namespace std;


struct parseTree
{
    char* name;
    char* action;
    int index;
    struct parseTree *left;
    struct parseTree *right;
};

parseTree *insert(char *newName, char *newAction, int newIndex, parseTree *newLeft, parseTree *newRight) {
    parseTree *newTree = new parseTree;
    newTree->name = newName;
    newTree->action = newAction;
    newTree->index = newIndex;
    newTree->left = newLeft;
    newTree->right = newRight;

    return newTree;
}

void printTree(parseTree* root, int indent = 0) {
    if (root != NULL) {
        printTree(root->right, indent + 2);
        cout << string(indent, ' ') <<  "**Node " << root->index <<  ": " << "action: " << root->action << " | " << "name: " << root->name << endl;
        printTree(root->left, indent + 2);
    }
}

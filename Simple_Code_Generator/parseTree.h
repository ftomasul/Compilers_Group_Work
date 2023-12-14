#include <iostream>
using namespace std;


struct parseTree
{
    char* name;
    char* action;
    char* other;
    struct parseTree *left;
    struct parseTree *right;
};

parseTree *insert(char *newName, char *newAction, parseTree *newLeft, parseTree *newRight) {
    parseTree *newTree = new parseTree;
    newTree->name = newName;
    newTree->action = newAction;
    newTree->left = newLeft;
    newTree->right = newRight;

    return newTree;
}

void printTree(parseTree* root, int indent = 0) {
    if (root != NULL) {
        printTree(root->right, indent + 2);
        cout << string(indent, ' ') <<  "**Node: " << "action: " << root->action << " | " << "name: " << root->name << endl;
        printTree(root->left, indent + 2);
    }
}

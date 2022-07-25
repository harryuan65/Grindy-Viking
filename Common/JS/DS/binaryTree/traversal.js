class Node {
  constructor(val, left = null, right = null) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}

let root = new Node(1);
root.left = new Node(2);
root.right = new Node(3, new Node(4), new Node(5));

function preorder(node) {
  if (!node.left && !node.right) {
    console.log(node.val, ' ');
    return;
  }

  console.log(node.val, ' ');
  if (node.left) preorder(node.left);
  if (node.right) preorder(node.right);
}

function inorder(node) {
  if (!node.left && !node.right) {
    console.log(node.val, ' ');
    return;
  }

  if (node.left) inorder(node.left);
  console.log(node.val, ' ');
  if (node.right) inorder(node.right);
}

function postorder(node) {
  if (!node.left && !node.right) {
    console.log(node.val, ' ');
    return;
  }

  if (node.left) postorder(node.left);
  if (node.right) postorder(node.right);
  console.log(node.val, ' ');
}

function levelorder(root) {
  let queue = [root];
  let values = [];
  while (queue.length > 0) {
    node = queue.shift();
    values.push(node.val);

    if (node.left) queue.push(node.left);
    if (node.right) queue.push(node.right);
  }
  console.log(values.join(', '));
}

console.log('preorder');
preorder(root);

console.log('inorder');
inorder(root);

console.log('postorder');
postorder(root);

console.log('levelorder');
levelorder(root);

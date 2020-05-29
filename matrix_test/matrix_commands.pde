// Matrix Stack Library

// You should modify the routines listed below to complete the assignment.
// Feel free to define any classes, global variables and helper routines that you need.

// BitLeigh Vu

double[][] matrix;

// initialize 4x4 identity matrix
void Init_Matrix() {
  matrix = new double[][] {
    {1.0, 0, 0, 0}, 
    {0, 1.0, 0, 0},
    {0, 0, 1.0, 0},
    {0, 0, 0, 1.0}
  };
}

// translate matrix by specified x, y, and z values 
void Translate(float x, float y, float z) { 
  double[][] translate = {
    {1, 0, 0, x}, 
    {0, 1, 0, y},
    {0, 0, 1, z},
    {0, 0, 0, 1}
  }; 
  
  preMultiply(translate);
}


// scale matrix values by varying x, y, and z scale factors
void Scale(float x, float y, float z) {  
  double[][] scale = {
    {x, 0, 0, 0}, 
    {0, y, 0, 0},
    {0, 0, z, 0},
    {0, 0, 0, 1}
  }; 
  
  preMultiply(scale);
}

// rotate matrix about x-axis
// theta in degrees
void RotateX(float theta) {
  double rad = radians(theta);
  double c = Math.cos(rad);
  double s = Math.sin(rad);
  
  double[][] xMat = {
    {1, 0, 0, 0}, 
    {0, c, -s, 0},
    {0, s, c, 0},
    {0, 0, 0, 1}
  }; 
  
  preMultiply(xMat);
}

// rotate matrix about y-axis
// theta in degrees
 void RotateY(float theta) {
  float rad = radians(theta);
  double c = Math.cos(rad);
  double s = Math.sin(rad);
  
  double[][] yMat = {
    {c, 0, s, 0}, 
    {0, 1, 0, 0},
    {-s, 0, c, 0},
    {0, 0, 0, 1}
  }; 
  
  preMultiply(yMat);
}

// theta in degrees
 void RotateZ(float theta) {
  float rad = radians(theta);
  double c = Math.cos(rad);
  double s = Math.sin(rad);
  
  double[][] zMat = {
    {c, -s, 0, 0}, 
    {s, c, 0, 0},
    {0, 0, 1, 0},
    {0, 0, 0, 1}
  }; 
  
  preMultiply(zMat);
 }

// prints matrix in specified form
void Print_Matrix() {
  for(int i = 0; i < 4; i++){
    System.out.print("[");
      for(int j = 0; j < 4; j++){
        if (j == 3) {
          System.out.print(matrix[i][j] + "]");
        } else {
         System.out.print(matrix[i][j] + ", ");
        }
      }
      System.out.print("\n");
  }
  System.out.print("\n");
}

// helper function to multiply matrix x rotationMatrix
void preMultiply(double[][] m) {
  double[][] temp = new double[4][4];
  
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      temp[i][j] = 0.0;
      for (int k = 0 ; k < 4; k++) {
        temp[i][j] +=  matrix[i][k] * m[k][j];
      }
    }
  }
  
  matrix = temp; 
}

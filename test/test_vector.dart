part of console_test_harness;

class VectorTest extends BaseTest {

  void testVec2DotProduct() {
    final vec2 inputA = new vec2(0.417267069084370, 0.049654430325742);
    final vec2 inputB = new vec2(0.944787189721646, 0.490864092468080);
    final num expectedOutput = 0.418602158442475;
    relativeTest(dot(inputA, inputB), expectedOutput);
    relativeTest(dot(inputB, inputA), expectedOutput);
  }

  void testVec2CrossProduct() {
    final vec2 inputA = new vec2(0.417267069084370, 0.049654430325742);
    final vec2 inputB = new vec2(0.944787189721646, 0.490864092468080);
    num expectedOutputCross = inputA.x * inputB.y - inputA.y * inputB.x;
    relativeTest(cross(inputA, inputB), expectedOutputCross);
    relativeTest(cross(1.0, inputA), new vec2(-inputA.y,  inputA.x));
    relativeTest(cross(inputA, 1.0), new vec2( inputA.y, -inputA.x));
  }

  void testVec3DotProduct() {
    List<vec3> inputA = new List<vec3>();
    List<vec3> inputB = new List<vec3>();
    List<double> expectedOutput = new List<double>();
    inputA.add(parseVector('''0.417267069084370
   0.049654430325742
   0.902716109915281'''));
    inputB.add(parseVector('''0.944787189721646
   0.490864092468080
   0.489252638400019'''));
    expectedOutput.add(0.860258396944727);
    assert(inputA.length == inputB.length);
    assert(inputB.length == expectedOutput.length);
    for (int i = 0; i < inputA.length; i++) {
      double output1 = dot(inputA[i], inputB[i]);
      double output2 = dot(inputB[i], inputA[i]);
      relativeTest(output1, expectedOutput[i]);
      relativeTest(output2, expectedOutput[i]);
    }
  }
  void testVec3CrossProduct() {
    List<vec3> inputA = new List<vec3>();
    List<vec3> inputB = new List<vec3>();
    List<vec3> expectedOutput = new List<vec3>();

    inputA.add(parseVector('''0.417267069084370
   0.049654430325742
   0.902716109915281'''));
    inputB.add(parseVector('''0.944787189721646
   0.490864092468080
   0.489252638400019'''));
    expectedOutput.add(parseVector('''  -0.418817363004761
   0.648725602136344
   0.157908551498227'''));

    inputA.add(parseVector('''0.944787189721646
      0.490864092468080
      0.489252638400019'''));
    inputB.add(parseVector('''0.417267069084370
      0.049654430325742
      0.902716109915281'''));
    expectedOutput.add(parseVector(''' 0.418817363004761
  -0.648725602136344
  -0.157908551498227'''));

    assert(inputA.length == inputB.length);
    assert(inputB.length == expectedOutput.length);

    for (int i = 0; i < inputA.length; i++) {
      vec3 output = cross(inputA[i], inputB[i]);
      relativeTest(output, expectedOutput[i]);
    }

    {
      vec3 x = new vec3.raw(1.0, 0.0, 0.0);
      vec3 y = new vec3.raw(0.0, 1.0, 0.0);
      vec3 z = new vec3.raw(0.0, 0.0, 1.0);
      vec3 output;

      output = x.cross(y);
      relativeTest(output, new vec3.raw(0.0, 0.0, 1.0));
      output = y.cross(x);
      relativeTest(output, new vec3.raw(0.0, 0.0, -1.0));

      output = x.cross(z);
      relativeTest(output, new vec3.raw(0.0, -1.0, 0.0));
      output = z.cross(x);
      relativeTest(output, new vec3.raw(0.0, 1.0, 0.0));

      output = y.cross(z);
      relativeTest(output, new vec3.raw(1.0, 0.0, 0.0));
      output = z.cross(y);
      relativeTest(output, new vec3.raw(-1.0, 0.0, 0.0));
    }
  }

  void testDefaultConstructor() {
    try {
      new vec2();
    } catch (e) {
      return;
    }
    print('failure.');

    try {
      new vec2(2, 4);
    } catch (e) {
      return;
    }
    print('failure.');
  }

  void test() {
    print('Running vector tests');
    testVec2DotProduct();
    testVec2CrossProduct();
    testVec3DotProduct();
    testVec3CrossProduct();
    testDefaultConstructor();
  }
}

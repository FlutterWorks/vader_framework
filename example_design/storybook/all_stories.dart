import 'package:storybook_toolkit/storybook_toolkit.dart';

import 'design/buttons/example_button.stories.dart';
import 'design/buttons/my_button.stories.dart';

final List<Story> allStories = [
  ...exampleButtonStories,
  ...myButtonStories,
];

// ignore_for_file: lines_longer_than_80_chars

import 'package:buzz_recipe_viewer/model/recipe_note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_note_repository_mock.g.dart';

@riverpod
Stream<List<RecipeNote>> dummyRecipeNoteStream(DummyRecipeNoteStreamRef ref) {
  return Stream.value([
    RecipeNote(
      title: '星空のフルーツタルト',
      description:
          'このレシピでは、真夜中の星空をイメージした美しいフルーツタルトを作ります。ブルーベリーや黒ぶどうなどの深い色合いのフルーツと、キウイやグリーンアップルなどの鮮やかなフルーツを組み合わせて、美味しくも美しいタルトを作り上げます。',
      foodList: [
        'タルト生地 - 1枚',
        'カスタードクリーム - 500g',
        '黒ぶどう - 200g',
        'キウイ - 2個',
        'グリーンアップル - 1個',
        'ゼラチン - 10g',
        '水 - 100ml',
        '砂糖 - 50g',
        'レモン汁 - 大さじ1',
        '銀色の食用スプレー - 適量',
      ],
      stepList: [
        'タルト生地を予熱したオーブン180℃で20分程度焼きます。',
        'キウイとグリーンアップルは小さな星型にカットします。ブルーベリーと黒ぶどうは半分に切ります。',
        'カスタードクリームを焼いたタルト生地に均一に広げます。',
        'ブルーベリーと黒ぶどうをタルト上に散りばめ、キウイとグリーンアップルの星型をデコレーションします。',
        'ゼラチンを水で戻し、砂糖とレモン汁を加えてからレンジで溶かします。溶かしたゼラチン液をフルーツの上にゆっくりと流します。',
        'ゼラチンが固まるまで冷蔵庫で冷やします。',
        '銀色の食用スプレーを軽く吹きかけて、星空のような輝きを出します。',
      ],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ]);
}

@riverpod
Stream<List<RecipeNote>> emptyRecipeNoteStream(EmptyRecipeNoteStreamRef ref) {
  return Stream.value([]);
}

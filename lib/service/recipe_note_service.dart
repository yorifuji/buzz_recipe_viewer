// ignore_for_file: lines_longer_than_80_chars

import 'package:buzz_recipe_viewer/model/recipe_note.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_note_service.g.dart';

@riverpod
RecipeNoteService recipeNoteService(RecipeNoteServiceRef ref) =>
    RecipeNoteService(ref.watch(databaseRepositoryProvider));

class RecipeNoteService {
  RecipeNoteService(this._databaseRepository);
  final DatabaseRepository _databaseRepository;

  Future<void> add(RecipeNote recipeNote) =>
      _databaseRepository.insertRecipeNote(recipeNote);

  Future<void> delete(RecipeNote recipeNote) =>
      _databaseRepository.deleteRecipeNote(recipeNote);

  Future<void> createDummyRecipeNote() async {
    final recipeNote = RecipeNote(
      '星空のフルーツタルト',
      'このレシピでは、真夜中の星空をイメージした美しいフルーツタルトを作ります。ブルーベリーや黒ぶどうなどの深い色合いのフルーツと、キウイやグリーンアップルなどの鮮やかなフルーツを組み合わせて、美味しくも美しいタルトを作り上げます。',
      [
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
      [
        'タルト生地を予熱したオーブン180℃で20分程度焼きます。',
        'キウイとグリーンアップルは小さな星型にカットします。ブルーベリーと黒ぶどうは半分に切ります。',
        'カスタードクリームを焼いたタルト生地に均一に広げます。',
        'ブルーベリーと黒ぶどうをタルト上に散りばめ、キウイとグリーンアップルの星型をデコレーションします。',
        'ゼラチンを水で戻し、砂糖とレモン汁を加えてからレンジで溶かします。溶かしたゼラチン液をフルーツの上にゆっくりと流します。',
        'ゼラチンが固まるまで冷蔵庫で冷やします。',
        '銀色の食用スプレーを軽く吹きかけて、星空のような輝きを出します。',
      ],
    );
    await _databaseRepository.insertRecipeNote(recipeNote);

    await _databaseRepository.insertRecipeNote(
      RecipeNote('砂漠のミラージュカクテル',
          'このレシピでは、砂漠とミラージュをテーマにしたエキゾチックなカクテルを作ります。さっぱりとした味わいと美しい色彩が特徴です。', [
        'テキーラ - 60ml',
        'ブルーキュラソー - 30ml',
        'レモンジュース - 30ml',
        'サイダー - 適量',
        '氷 - 適量',
        'レモンスライス - 1枚'
      ], [
        'シェーカーにテキーラ、ブルーキュラソー、レモンジュース、氷を入れてよく振ります。',
        'カクテルグラスに注ぎ、サイダーで満たします。',
        '最後にレモンスライスを添えて完成です。'
      ]),
    );

    await _databaseRepository.insertRecipeNote(
      RecipeNote(
        'レインボーベジタブルピザ',
        '色とりどりの野菜を使って虹色に彩られたヘルシーピザを作ります。見た目も楽しく、栄養満点のピザです。',
        [
          'ピザ生地 - 1枚',
          'ピザソース - 200g',
          'モッツァレラチーズ - 200g',
          '赤パプリカ - 1個',
          'オレンジパプリカ - 1個',
          '黄パプリカ - 1個',
          '緑パプリカ - 1個',
          '紫キャベツ - 100g',
          'オリーブオイル - 大さじ1',
          '塩と黒胡椒 - 適量'
        ],
        [
          '各パプリカと紫キャベツを薄切りにします。',
          'ピザ生地にピザソースを塗り、モッツァレラチーズを均等に散らします。',
          'パプリカと紫キャベツを虹の色順にピザ生地の上に並べます。',
          'オリーブオイルを全体にかけ、塩と黒胡椒で味を調えます。',
          '予熱したオーブンで200℃で15分、またはチーズが溶けて軽く焦げ目がつくまで焼きます。'
        ],
      ),
    );
  }
}

@riverpod
Future<void> initRecipeNoteService(InitRecipeNoteServiceRef ref) async {
  final recipeNoteService = ref.read(recipeNoteServiceProvider);
  await recipeNoteService.createDummyRecipeNote();
}

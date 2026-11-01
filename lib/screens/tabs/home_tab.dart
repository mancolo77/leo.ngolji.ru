import 'package:flutter/material.dart';
import '../../services/user_progress_service.dart';
import '../../theme/app_theme.dart';

class ArticleItem {
  final String id;
  final String category;
  final String title;
  final String summary;
  final String content;
  final String readTime;

  const ArticleItem({
    required this.id,
    required this.category,
    required this.title,
    required this.summary,
    required this.content,
    required this.readTime,
  });
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final UserProgressService _progress = UserProgressService();

  int _selectedQuizAnswer = -1;
  bool _quizSubmitted = false;

  final List<ArticleItem> _articles = const [
    ArticleItem(
      id: 'leo_art_1',
      category: 'Футбол • Аналитика',
      title: 'Быстрый переход из обороны в атаку: вертикальный футбол',
      summary: 'Разбор передач в свободные зоны и открываний крайних полузащитников.',
      content: 'Вертикальный футбол основывается на минимизации числа поперечных передач. Команда стремится доставить мяч в финальную треть поля за 2-3 точных паса, используя забегания инсайдов за спину защитникам.',
      readTime: '3 мин',
    ),
    ArticleItem(
      id: 'leo_art_2',
      category: 'Теннис • Мастерство',
      title: 'Топ-спин и угол атаки: физика вращения теннисного мяча',
      summary: 'Как современная техника ударов с задней линии изменила грунтовые турниры.',
      content: 'При ударе с верхним вращением мяч совершает до 3000 оборотов в минуту. Эффект Магнуса прижимает мяч к корту, позволяя наносить удары на огромной скорости без риска аута.',
      readTime: '4 мин',
    ),
    ArticleItem(
      id: 'leo_art_3',
      category: 'Хоккей • Стратегия',
      title: 'Борьба у бортов и выигранные нейтральные шайбы',
      summary: 'Почему контроль нейтральной зоны приносит победы в затяжных сериях.',
      content: 'Большинство опасных атак начинается с выигранного единоборства у борта. Силовая борьба и грамотная подстраховка защитника на синей линии создают преимущество вторым темпом.',
      readTime: '2 мин',
    ),
  ];

  final List<String> _facts = [
    'Футбольные бутсы для игры на мокром газоне имеют специальные конические металлические шипы.',
    'Теннисный мяч меняют каждые 9 геймов на профессиональных турнирах Большого шлема.',
    'Шлем хоккеиста выдерживает прямое попадание шайбы на скорости свыше 160 км/ч.',
  ];

  void _openArticleDetails(ArticleItem article) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.surfaceCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppTheme.cardRadius)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final isSaved = _progress.savedArticleIds.contains(article.id);
            return Container(
              padding: const EdgeInsets.all(AppTheme.screenPadding),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.85,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppTheme.border,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.filterBg,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            article.category,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primary,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                            color: AppTheme.primary,
                          ),
                          onPressed: () {
                            _progress.toggleSaveArticle(article.id);
                            setModalState(() {});
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textMain,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Время чтения: ${article.readTime}',
                      style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary),
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: AppTheme.border),
                    const SizedBox(height: 16),
                    Text(
                      article.content,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppTheme.textMain,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: AppTheme.buttonHeight,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('Понятно'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progress,
      builder: (context, _) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(AppTheme.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Главная',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textMain,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceCard,
                      borderRadius: BorderRadius.circular(AppTheme.buttonRadius),
                      border: Border.all(color: AppTheme.border),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.stars_rounded, color: AppTheme.greenLight, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          '${_progress.points} баллов',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textMain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'Спортивные события, статьи и проверка эрудиции',
                style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
              ),
              const SizedBox(height: 18),

              // 1. Красный информационный баннер по ТЗ (#ED0028)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppTheme.accentRed,
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                  boxShadow: AppTheme.cardShadow,
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.accentRed,
                      Color(0xFFC70020),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(45),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.emoji_events_rounded, color: Colors.white, size: 22),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'СПОРТИВНЫЙ БЛИЦ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(40),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            '+30 баллов',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Сколько игроков одной команды одновременно находится на поле в футболе?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 14),
                    ...[
                      '10 игроков',
                      '11 игроков',
                      '12 игроков',
                    ].asMap().entries.map((entry) {
                      final idx = entry.key;
                      final optionText = entry.value;
                      final isSelected = _selectedQuizAnswer == idx;
                      final isCorrect = (idx == 1);

                      Color btnColor = Colors.white.withAlpha(35);
                      if (_quizSubmitted) {
                        if (isCorrect) btnColor = const Color(0xFF109E59);
                        if (isSelected && !isCorrect) btnColor = Colors.black45;
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: InkWell(
                          onTap: _quizSubmitted
                              ? null
                              : () {
                                  setState(() {
                                    _selectedQuizAnswer = idx;
                                    _quizSubmitted = true;
                                    if (isCorrect) {
                                      _progress.recordQuizCompleted(30);
                                    }
                                  });
                                },
                          borderRadius: BorderRadius.circular(AppTheme.buttonRadius),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: btnColor,
                              borderRadius: BorderRadius.circular(AppTheme.buttonRadius),
                              border: Border.all(
                                color: isSelected ? Colors.white : Colors.white24,
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  optionText,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                if (_quizSubmitted && isCorrect)
                                  const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20)
                                else if (_quizSubmitted && isSelected && !isCorrect)
                                  const Icon(Icons.cancel_rounded, color: Colors.white70, size: 20),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2. Статьи в белых карточках (#FFFFFF)
              const Text(
                'Спортивные статьи',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textMain,
                ),
              ),
              const SizedBox(height: 12),
              ..._articles.map((art) {
                final isSaved = _progress.savedArticleIds.contains(art.id);
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceCard,
                    borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                    border: Border.all(color: AppTheme.border),
                    boxShadow: AppTheme.cardShadow,
                  ),
                  child: InkWell(
                    onTap: () => _openArticleDetails(art),
                    borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceSecondary,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                art.category,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primary,
                                ),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: Icon(
                                isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                                color: AppTheme.primary,
                                size: 22,
                              ),
                              onPressed: () => _progress.toggleSaveArticle(art.id),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          art.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textMain,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          art.summary,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.textSecondary,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 16),

              // 3. Факты дня
              const Text(
                'Интересный факт',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textMain,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceCard,
                  borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                  border: Border.all(color: AppTheme.border),
                  boxShadow: AppTheme.cardShadow,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline_rounded, color: AppTheme.greenLight, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _facts[DateTime.now().minute % _facts.length],
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppTheme.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}


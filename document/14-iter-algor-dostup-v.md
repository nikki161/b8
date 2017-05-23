##  ��������� ���������, ������������ ��������

#### ���������� ������
����� ��������� ��������� ������ ������� ������.

####�������� ���������
```
OUT [����] = 0; 
for (������ ������� ���� �, �������� �� ��������) OUT [�] = U; 
while (������� ��������� � OUT) 
for (������ ������� ���� �, �������� �� ��������) { 
IN [�] = ��-�������������� � OUT [P]; 
OUT [�] = e_genB U (IN [�] - �_���); 
} 
```
####������� ������
����: ���� ������, � �������� ��� ������� ����� � ��������� e_killB � e_genB. 

#### �������� ������ 
������� ins � outs, ���������� � ���� ��������� ��� ������� �����, ������������ �� ��������� �������� ���������.
```
InBlocks[vertce.Value] = UnionNodes(InBlocks[vertce.Value], OutBlocks[parent.Value]);

OutBlocks[vertce.Value] = new List<Expression>(genKills.AllExpressions);
```

#### ���������� ���������
```
class AvailableExprAnalyzer

    {
        public readonly Dictionary<IBaseBlock, List<Expression>> InBlocks = new Dictionary<IBaseBlock, List<Expression>>();
        public readonly Dictionary<IBaseBlock, List<Expression>> OutBlocks = new Dictionary<IBaseBlock, List<Expression>>();
        public readonly GenKillExprs genKills;

        protected readonly CFGraph cfg;

        public AvailableExprAnalyzer(CFGraph _cfg)
        {
            
            cfg = _cfg;
            // ���������� e_gen � e_kills
            genKills = new GenKillExprs(cfg);

            // �������������� ��� ���� ��� ������ ������ � �������� �����������
            foreach (var vertice in cfg.GetVertices())
            {
                InBlocks.Add(vertice.Value, new List<Expression>());
            }
        }

        public void analyze()
        {
            var firstBlock = cfg.GetVertices().First();
            var vertces = cfg.GetVertices();
            // �������������� ��� ������� ��� ����� �������� ������ �������� ��������� ������ U (��������� ���� ���������)
            foreach (var vertce in vertces)
            {
                if (firstBlock != vertce.Value)
                {
                    OutBlocks[vertce.Value] = new List<Expression>(genKills.AllExpressions);
                }
            }

            bool hasChanges = true;

            while (hasChanges)
            {
                hasChanges = false;

                foreach (var vertce in vertces)
                {
                    if (firstBlock != vertce.Value)
                    {
                        // ��������� �� ������� ��������� ��� ���������, ������� ������� �� ������������ ������
                        foreach (var parent in vertce.ParentsNodes)
                        {
                            InBlocks[vertce.Value] = UnionNodes(InBlocks[vertce.Value], OutBlocks[parent.Value]);
                        }

                        //�������� ������ ������ �������� ��������� ��� ��������� � �������
                        var oldOut = new List<Expression>(OutBlocks[vertce.Value]);

                        // IN[B] - e_kill_B - ������� � ������ ������� ��������� ��, ������� ����� ����� � ������� ������� �����
                        var resNodes = ResidualNodes(InBlocks[vertce.Value], genKills.Remove[vertce.Value]);

                        // ���������� ���������� IN[B] � e_gen_B, �.�. ��� ��� �������� ����� �������� ����� ����� IN � e_kill ���������� � ���, ��� �������� � ������ ��� 
                        // C�������� ��� ��� ��� �������� ��������� ��� �������� �������� �����
                        OutBlocks[vertce.Value] = UnionNodes(genKills.Gen[vertce.Value], resNodes);

                        // ���� �� �������� ������ �������� ���������, �� �� ������� ����� ������ �� ���� ������ � ����������� ����/�����, ��� ��� ���� ��������� �� ������ ������ ������, ������� ����� ���� ��������
                        if (!EqualNodes(OutBlocks[vertce.Value], oldOut))
                        {
                            hasChanges = true;
                        }
                    }
                }
            }
        }
```
----------


